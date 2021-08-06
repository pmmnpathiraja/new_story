import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_story/model/selling.dart';
import 'package:new_story/screens/userHome.dart';

class salesReceipt extends StatefulWidget {
  salesReceipt(this.sellingData, this.phoneNumber);
  SellingData sellingData;
  late String phoneNumber;
  @override
  State<StatefulWidget> createState() {
    return _salesReceiptState();
  }
}

class _salesReceiptState extends State<salesReceipt> {
  final dateTime = DateTime.now();
  User _firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sales Receipt'),
      ),
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Column(children: <Widget>[
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.blue[400],
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 20, bottom: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Date: ",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Container(
                              child: Text(
                                "$dateTime", //Date variable should be there
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              //margin: EdgeInsetsDirectional.only(start: 10),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 10, bottom: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Purchased ID: ",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: Text(
                                "${widget.sellingData.sellingID}", //Date variable should be there
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              //margin: EdgeInsetsDirectional.only(start: 10),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 10, bottom: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Miller Name: ",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: Text(
                                "${widget.sellingData.farmerName}", //Date variable should be there
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              //margin: EdgeInsetsDirectional.only(start: 10),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 10, bottom: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Mobile Number: ",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: Text(
                                "${widget.phoneNumber}", //Date variable should be there
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              //margin: EdgeInsetsDirectional.only(start: 10),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 18,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 2.0, right: 25.0, left: 25.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Colors.blue[100],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Paddy Type ",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 150),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          "SAMBA", //Date variable should be there
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18),
                        ),
                        //margin: EdgeInsetsDirectional.only(start: 10),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Number of Kilos ",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 120),
                      child: Container(
                        child: Text(
                          "${widget.sellingData.sub_total_kg}", //Date variable should be there
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18),
                        ),
                        //margin: EdgeInsetsDirectional.only(start: 10),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Purchasing price",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 125),
                      child: Container(
                        child: Text(
                          "${widget.sellingData.samba_Price}", //Date variable should be there
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18),
                        ),
                        //margin: EdgeInsetsDirectional.only(start: 10),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Number of Paddy Bags",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 80),
                      child: Container(
                        child: Text(
                          "${widget.sellingData.sub_paddy_bags}", //Date variable should be there
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18),
                        ),
                        //margin: EdgeInsetsDirectional.only(start: 10),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[500],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 200),
                      child: Container(
                        child: Text(
                          "${widget.sellingData.sub_total}", //Date variable should be there
                          style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        //margin: EdgeInsetsDirectional.only(start: 10),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Profit/Loss",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 165),
                      child: Container(
                        child: Text(
                          "${widget.sellingData.profitLoss}", //Date variable should be there
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 18),
                        ),
                        //margin: EdgeInsetsDirectional.only(start: 10),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Thank You!",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () async {
                          // double avgSambaPriceCal =
                          // ((widget.buyingData.avgSambaPrice +
                          //     widget.buyingData.samba_Price) /
                          //     (widget.buyingData.purchaseID-10000));
                          // await FirebaseFirestore.instance
                          //     .collection('User_farmer')
                          //     .doc(_firebaseUser.displayName)
                          //     .collection("Price")
                          //     .doc("Price")
                          //     .update({
                          //   'SambaPrice': avgSambaPriceCal,
                          // });
                          await FirebaseFirestore.instance
                              .collection('User_farmer')
                              .doc(_firebaseUser.displayName)
                              .collection("ID")
                              .doc("ID")
                              .update({
                            'SellingID': widget.sellingData.sellingID,
                          });

                          await FirebaseFirestore.instance
                              .collection('User_farmer')
                              .doc(_firebaseUser.displayName)
                              .collection("Stock")
                              .doc("Stock")
                              .update({
                            'SambaStock': widget.sellingData.stock
                          });

                          await FirebaseFirestore.instance
                              .collection('User_farmer')
                              .doc(_firebaseUser.displayName)
                              .collection("Transaction_details_Miller")
                              .doc(widget.sellingData.sellingID
                              .toString())
                              .set({
                            "Date": dateTime,
                            "Purchased ID":
                            widget.sellingData.sellingID,
                            "Farmer Name": widget.sellingData.farmerName,
                            "Farmer Mobile": widget.phoneNumber,
                            "Paddy Type": "SAMBA",
                            "Number of Kilo":
                            widget.sellingData.sub_total_kg,
                            "Price of 1 KG":
                            widget.sellingData.samba_Price,
                            "Number of paddy bags":
                            widget.sellingData.sub_paddy_bags,
                            "total": widget.sellingData.sub_total,
                            "profit" :widget.sellingData.profitLoss,
                          });
                          await FirebaseFirestore.instance
                              .collection('User_farmer')
                              .doc(_firebaseUser.displayName)
                              .collection(
                              "Transaction_details_by_Miller")
                              .doc("By Miller")
                              .collection(widget.phoneNumber)
                              .doc(widget.sellingData.sellingID
                              .toString())
                              .set({
                            "Date": dateTime,
                            "Purchased ID":
                            widget.sellingData.sellingID,
                            "Farmer Name": widget.sellingData.farmerName,
                            "Farmer Mobile": widget.phoneNumber,
                            "Paddy Type": "SAMBA",
                            "Number of Kilo":
                            widget.sellingData.sub_total_kg,
                            "Price of 1 KG":
                            widget.sellingData.samba_Price,
                            "Number of paddy bags":
                            widget.sellingData.sub_paddy_bags,
                            "total": widget.sellingData.sub_total,
                            "profit" :widget.sellingData.profitLoss,
                          });
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Conform",
                            style: TextStyle(
                                fontSize: 21, color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 10,),
                Container(
                  //margin: EdgeInsets.fromLTRB(50, 10, 30, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.blue[500],
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => second()),
                                  // );
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Send SMS",
                                    style: TextStyle(
                                        fontSize: 21, color: Colors.white),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 300,
                            // decoration: BoxDecoration(
                            //   color: Colors.blue[500],
                            //   borderRadius: BorderRadius.circular(35),
                            // ),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => userHome()),
                                    );
                                    // final snackBar = SnackBar(
                                    //   content: Text('Yay! A SnackBar!'),
                                    //   action: SnackBarAction(
                                    //     label: 'Undo',
                                    //     onPressed: () {
                                    //       // Some code to undo the change.
                                    //     },
                                    //   ),
                                    // );
                                    // // Navigator.push(
                                    // //   context,
                                    // //   MaterialPageRoute(
                                    // //       builder: (context) => second()),
                                    // // );
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Skip & Finish Transactioin",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                )))
                      ],
                    ),
                  ),
                )
              ]),
            ])),
      ),
    );
  }
}
