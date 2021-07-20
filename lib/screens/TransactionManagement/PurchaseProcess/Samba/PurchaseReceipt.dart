import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_story/model/buying.dart';
import 'package:new_story/screens/userHome.dart';

class purchaseReceipt extends StatefulWidget {
  purchaseReceipt(this.buyingData, this.phoneNumber);
  BuyingData buyingData;
  late String phoneNumber;
  @override
  State<StatefulWidget> createState() {
    return _purchaseReceiptState();
  }
}

class _purchaseReceiptState extends State<purchaseReceipt> {
  final dateTime = DateTime.now();
  User _firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Purchase Receipt'),
        ),
        backgroundColor: Colors.blue[50],
        body: Padding(
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
                                left: 30, top: 30, bottom: 10),
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
                            padding: const EdgeInsets.only(top: 30, bottom: 10),
                            child: Container(
                              child: Text(
                                "$dateTime",
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
                                "${widget.buyingData.purchaseID}", //Date variable should be there
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              //margin: EdgeInsetsDirectional.only(start: 10),
                            ),
                          )
                        ],
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     Padding(
                      //       padding: const EdgeInsets.only(
                      //           left: 30, top: 10, bottom: 10),
                      //       child: Container(
                      //         alignment: Alignment.topLeft,
                      //         child: Text(
                      //           "Farmer ID: ",
                      //           style: TextStyle(
                      //               fontSize: 18, color: Colors.white),
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 10, bottom: 10),
                      //       child: Container(
                      //         child: Text(
                      //           "0012", //Date variable should be there
                      //           style: TextStyle(
                      //               color: Colors.white, fontSize: 18),
                      //         ),
                      //         //margin: EdgeInsetsDirectional.only(start: 10),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 10, bottom: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Farmer Name: ",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              child: Text(
                                "${widget.buyingData.farmerName}", //Date variable should be there
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
                      padding: const EdgeInsets.only(bottom: 10, left: 140),
                      child: Container(
                        child: Text(
                          "${widget.buyingData.sub_total_kg}", //Date variable should be there
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
                          "Price of 1KG",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 180),
                      child: Container(
                        child: Text(
                          "${widget.buyingData.samba_Price}", //Date variable should be there
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
                      padding: const EdgeInsets.only(bottom: 10, left: 95),
                      child: Container(
                        child: Text(
                          "${widget.buyingData.sub_paddy_bags}", //Date variable should be there
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
                          "${widget.buyingData.sub_total}", //Date variable should be there
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
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 10),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Thank You!",
                        style: TextStyle(
                            fontSize: 38,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
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
                                onPressed: () async {
                                  double avgSambaPriceCal =
                                  ((widget.buyingData.avgSambaPrice +
                                              widget.buyingData.samba_Price) /
                                          (widget.buyingData.purchaseID-10000));
                                  await FirebaseFirestore.instance
                                      .collection('User_farmer')
                                      .doc(_firebaseUser.displayName)
                                      .collection("Price")
                                      .doc("Price")
                                      .update({
                                    'SambaPrice': avgSambaPriceCal,
                                  });
                                  await FirebaseFirestore.instance
                                      .collection('User_farmer')
                                      .doc(_firebaseUser.displayName)
                                      .collection("ID")
                                      .doc("ID")
                                      .update({
                                    'PurchaseID': widget.buyingData.purchaseID,
                                  });

                                  await FirebaseFirestore.instance
                                      .collection('User_farmer')
                                      .doc(_firebaseUser.displayName)
                                      .collection("Stock")
                                      .doc("Stock")
                                      .update({
                                    'SambaStock': widget.buyingData.stock
                                  });

                                  await FirebaseFirestore.instance
                                      .collection('User_farmer')
                                      .doc(_firebaseUser.displayName)
                                      .collection("Transaction_details")
                                      .doc(widget.buyingData.purchaseID
                                          .toString())
                                      .set({
                                    "Date": dateTime,
                                    "Purchased ID":
                                        widget.buyingData.purchaseID,
                                    "Farmer Name": widget.buyingData.farmerName,
                                    "Farmer Mobile": widget.phoneNumber,
                                    "Paddy Type": "SAMBA",
                                    "Number of Kilo":
                                        widget.buyingData.sub_total_kg,
                                    "Price of 1 KG":
                                        widget.buyingData.samba_Price,
                                    "Number of paddy bags":
                                        widget.buyingData.sub_paddy_bags,
                                    "total": widget.buyingData.sub_total,
                                  });
                                  await FirebaseFirestore.instance
                                      .collection('User_farmer')
                                      .doc(_firebaseUser.displayName)
                                      .collection(
                                          "Transaction_details_by_farmer")
                                      .doc("By Farmer")
                                      .collection(widget.phoneNumber)
                                      .doc(widget.buyingData.purchaseID
                                          .toString())
                                      .set({
                                    "Date": dateTime,
                                    "Purchased ID":
                                        widget.buyingData.purchaseID,
                                    "Farmer Name": widget.buyingData.farmerName,
                                    "Farmer Mobile": widget.phoneNumber,
                                    "Paddy Type": "SAMBA",
                                    "Number of Kilo":
                                        widget.buyingData.sub_total_kg,
                                    "Price of 1 KG":
                                        widget.buyingData.samba_Price,
                                    "Number of paddy bags":
                                        widget.buyingData.sub_paddy_bags,
                                    "total": widget.buyingData.sub_total,
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
                        SizedBox(
                          height: 10,
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
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => userHome()),
                                    // );
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
            ])));
  }
}
