import 'package:flutter/material.dart';

import 'package:new_story/screens/TransactionManagement/SaleProcess/SalesReceipt.dart';

class registerMiller extends StatefulWidget {
  @override
  _registerMillerState createState() => _registerMillerState();
}

class _registerMillerState extends State<registerMiller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => salesReceipt()),
          );
        },
        child: const Icon(Icons.navigate_next),
        backgroundColor: Colors.blue,
      ),
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
                height: 300,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.lightBlue),
                  // borderRadius: BorderRadius.circular(1),
                  image: DecorationImage(
                    image: AssetImage('android/images/farmer.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 10,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: AutofillHints.name,
                  hintText: "Enter Miller's/Business name",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 10,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: AutofillHints.telephoneNumber,
                  hintText: "Enter Mobile Number",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 10,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: AutofillHints.postalAddress,
                  hintText: "Enter Address",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
          ],
        ),
      ),
    );
  }
}
