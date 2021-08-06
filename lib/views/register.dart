import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_story/loginInit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_story/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:string_validator/string_validator.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class Item {
  const Item(this.name);
  final String name;
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nationalIDNumberController = TextEditingController();

  int _emailValidator = 0;
  final bar = SnackBar(content: Text('Hello, world!'));


  @override
  Widget build(BuildContext context) {
    final appBar = Padding(
      padding: EdgeInsets.only(bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )
        ],
      ),
    );

    final pageTitle = Container(
      child: Text(
        "Tell us about you.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 40.0,
        ),
      ),
    );

    final formFieldSpacing = SizedBox(
      height: 30.0,
    );

    final registerForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildFormNameField('Name', LineIcons.user,_nameController),
            formFieldSpacing,
            _buildFormEmailField('Email Address', LineIcons.envelope,_emailController),
            formFieldSpacing,
            _buildFormPhoneField('Phone Number', LineIcons.mobile_phone,_phoneNumberController),
            formFieldSpacing,
            _buildFormPasswordField('Password', LineIcons.lock,_passwordController),
            formFieldSpacing,
            buildFormNICNumberField('NIC Number', LineIcons.lock,_nationalIDNumberController),
            formFieldSpacing,
          ],
        ),
      ),
    );


    final submitBtn = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.white),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(7.0),
          color: primaryColor,
          elevation: 10.0,
          shadowColor: Colors.white70,
          child: MaterialButton(
            //onPressed: () => Navigator.of(context).pushNamed(homeViewRoute),
            onPressed: () async {
              _emailValidator =0;
              if (_formKey.currentState!.validate()) {
                print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")  ;
                _register();
              }
            },
            child: Text(
              'CREATE ACCOUNT',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              appBar,
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    pageTitle,
                    registerForm,
                    Divider(),
                    submitBtn,

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildFormVehicleNumberField(String label, IconData icon,TextEditingController _textController) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      validator: (var value) {
        print(_textController);
        if (value!.isNotEmpty) {
          if(!isLength(_textController.text, 5)) {
            return 'Use characters more than 5';
          }
          return null;
        }
        return 'Please enter the Vehicle Number';
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }
  Widget _buildFormNameField(String label, IconData icon,TextEditingController _textController) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      validator: (var value) {
        if(value!.isNotEmpty) {
          if (!isAlpha(_textController.text) && !contains(_textController.text,'') ) {
            return 'Please ! fill this using only letters';
          }
          return null;
        }
        return "Please enter the user name";
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }
  Widget _buildFormEmailField(String label, IconData icon,TextEditingController _textController) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      validator: (var value) {
        if(value!.isNotEmpty) {
          if (!isEmail(_textController.text)) {
            return 'Please ! fill this use correct Email';
          }
          return null;
        }
        return  _emailValidator != 1?  " This Email is Already used ":"Please Enter the Email";
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }
  Widget _buildFormPhoneField(String label, IconData icon,TextEditingController _textController) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      validator: (var value) {
        if (value!.isNotEmpty) {
          if(!isNumeric(_textController.text) && !isLength(_textController.text, 9,10)){
            return 'Please enter the valid Phone number';
          }
          return null;
        }
        return 'Please enter the Phone number';
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }
  Widget _buildFormPasswordField(String label, IconData icon,TextEditingController _textController) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      validator: (var value) {
        print(_textController);
        if (value!.isNotEmpty) {
          if(!isLength(_textController.text, 8)) {
            return 'Use characters more than 8';
          }
          return null;
        }
        return 'Please enter the Password';
      },
      obscureText: true,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }

  Widget buildFormNICNumberField(String label, IconData icon,TextEditingController _textController) {
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black38,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      validator: (var value) {
        print(_textController);
        if (value!.isNotEmpty) {
          if(!isLength(_textController.text, 9)) {
            return 'Use characters more than 8';
          }
          return null;
        }
        return 'Please enter the Password';
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }

  void _clearForm() {
    _emailController.clear();
  }

  void _register() async {
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")  ;
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (authResult != null) {

        User firebaseUser = authResult.user;

        if (firebaseUser != null) {
          await firebaseUser.updateProfile(displayName:_nationalIDNumberController.text);

          await firebaseUser.reload();
          print("Sign up: $firebaseUser");
          userUploadData();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return LoginInit();
          }));
        }
      }
    } catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          _clearForm();
          if (_formKey.currentState!.validate()) {
            _emailValidator = 1;
          }
          return null;
        }
      }
    }
  }

  void userUploadData() async {
    FirebaseFirestore.instance.collection("User").doc(_nationalIDNumberController.text).set({
      'Name': _nameController.text,
      'Email Address': _emailController.text,
      'Phone Number': _phoneNumberController.text,
      'NIC Number': _nationalIDNumberController.text,
    }).then((_) {
      FirebaseFirestore.instance
          .collection('User_farmer')
          .doc(_nationalIDNumberController.text)
          .collection("ID")
          .doc("ID").set({
        'PurchaseID': 10000,
        'SellingID' :10000,

      });
      FirebaseFirestore.instance
          .collection('User_farmer')
          .doc(_nationalIDNumberController.text)
          .collection("Stock")
          .doc("Stock").set({
        'SambaStock': 0.0,
        'NaduStock': 0.0,
        'KeeriStock': 0.0,
      });
      FirebaseFirestore.instance
          .collection('User_farmer')
          .doc(_nationalIDNumberController.text)
          .collection("Price")
          .doc("Price")
          .set({
        'SambaPrice': 0.0,
        'NaduPrice': 0.0,
        'KeeriPrice': 0.0,
      });
    });
  }
}




