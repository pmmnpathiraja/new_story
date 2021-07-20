import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_story/model/buying.dart';
import 'package:new_story/model/selling.dart';
import 'package:new_story/screens/TransactionManagement/PurchaseProcess/Samba/PurchaseReceipt.dart';
import 'package:new_story/screens/TransactionManagement/SaleProcess/SalesReceipt.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:string_validator/string_validator.dart';

class registerMiller extends StatefulWidget {
  registerMiller(this.sellingData, this.phoneNumber);
  late String phoneNumber;
  SellingData sellingData;
  @override
  _registerMillerState createState() => _registerMillerState();
}

class _registerMillerState extends State<registerMiller> {
  @override
  TextEditingController _farname = new TextEditingController();
  TextEditingController _faraddress = new TextEditingController();
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

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => purchaseReceipt()),
      //     );
      //   },
      //   child: const Icon(Icons.navigate_next),
      //   backgroundColor: Colors.blue,
      // ),
      appBar: AppBar(
        title: Text('Input Miller Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // SizedBox(
            //   width: double.infinity,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(bottom: 8.0),
            //         child: Text(
            //           "Enter Farmer Details",
            //           style: TextStyle(
            //               color: Colors.blue[600],
            //               //fontFamily: "Oxygen",
            //               fontSize: 25,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
              child: TextFormField(
                controller: _farname,
                decoration: InputDecoration(
                  hintText: "Miller Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                validator: (var value) {
                  if (value!.isEmpty) {
                    return "Miller Name is not entered";
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 30),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _farcontact,
                decoration: InputDecoration(
                  hintText: "${widget.phoneNumber}",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                // validator: (var value) {
                //   if (value!.isEmpty) {
                //     return widget.phoneNumber;
                //   }
                //   return null;
                // },
                validator: (var value) {
                  if (value!.isNotEmpty) {
                    if (!isNumeric(value) &&
                        !isLength(value, 9, 10)) {
                      return 'Please enter the valid Phone number';
                    }
                    return null;
                  }
                  return widget.phoneNumber;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 30),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: TextFormField(
                controller: _faraddress,
                decoration: InputDecoration(
                  hintText: "Miller's address",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                validator: (var value) {
                  if (value!.isEmpty) {
                    return "Miller's address is not entered";
                  }
                  return null;
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
                  onPressed: () async {
                    // print(_firebaseUser.displayName);
                    // print(_farcontact.text);
                    FirebaseFirestore.instance.collection('User_farmer').doc(_firebaseUser.displayName)
                        .collection(widget.phoneNumber).doc("Miller_Details").set({
                      "Miller Name": _farname.text,
                      "Phone Number": widget.phoneNumber,
                      "Address": _faraddress.text,
                    });
                    widget.sellingData.farmerName = _farname.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => salesReceipt(
                                widget.sellingData, widget.phoneNumber)));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  textColor: Colors.white,
                  child: Text(
                    "Register",
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
