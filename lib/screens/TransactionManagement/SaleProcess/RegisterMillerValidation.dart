import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_story/model/buying.dart';
import 'package:new_story/model/selling.dart';
import 'package:new_story/screens/TransactionManagement/PurchaseProcess/Samba/PurchaseReceipt.dart';
import 'package:new_story/screens/TransactionManagement/PurchaseProcess/Samba/RegisterFarmer.dart';
import 'package:new_story/screens/TransactionManagement/SaleProcess/RegisterMiller.dart';
import 'package:new_story/screens/TransactionManagement/SaleProcess/SalesReceipt.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:string_validator/string_validator.dart';

class RegisterMillerValidation extends StatefulWidget {
  RegisterMillerValidation(this.sellingDataData);
  SellingData sellingDataData;
  @override
  _RegisterMillerValidationState createState() => _RegisterMillerValidationState();
}

class _RegisterMillerValidationState extends State<RegisterMillerValidation> {
  @override
  TextEditingController _farcontact = new TextEditingController();
  User _firebaseUser = FirebaseAuth.instance.currentUser;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late SharedPreferences prefs;
  final _codeController = TextEditingController();

  initSherePrefernce() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initSherePrefernce();
    super.initState();
  }

  Future<void> validation() async {

    prefs.setBool('isLogin', true);
    final usersref =
    FirebaseFirestore.instance.collection('User_farmer').doc(_firebaseUser.displayName)
        .collection(_farcontact.text);
    DocumentSnapshot docCurrent = await usersref.doc("Miller_Details").get();

    if (docCurrent.exists) {
      widget.sellingDataData.farmerName = docCurrent.data()['Miller Name'];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  salesReceipt(widget.sellingDataData, _farcontact.text)));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  registerMiller(widget.sellingDataData, _farcontact.text)));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Input Miller Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
                height: 250,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue),
                  // borderRadius: BorderRadius.circular(1),
                  image: DecorationImage(
                    image: AssetImage('android/images/farmer.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 30),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child:
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _farcontact,
                decoration: InputDecoration(
                  hintText: "Miller's contact no",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                validator: (var value) {
                  if (value!.isNotEmpty) {
                    if (!isNumeric(_farcontact.text) &&
                        !isLength(_farcontact.text, 9, 10)) {
                      return 'Please enter the valid Phone number';
                    }
                    return null;
                  }
                  return 'Please enter the Phone number';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  color: Colors.blue[600],
                  onPressed: () {
                    // if (_formkey.currentState!.validate()) {
                    validation();
                    //}
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  textColor: Colors.white,
                  child: Text(
                    "Validate",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
