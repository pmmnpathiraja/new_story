import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_story/screens/Extras/Calculator.dart';
import 'package:new_story/screens/Extras/HistoryTransaction.dart';
import 'package:new_story/screens/Extras/Stock.dart';
import 'package:new_story/screens/TransactionManagement/PurchaseProcess/Samba/Pfirst.dart';
import 'package:new_story/screens/TransactionManagement/SaleProcess/Samba/SFirst.dart';

import '../screens/setting.dart';

// ignore: camel_case_types
class userHome extends StatefulWidget {
  @override
  _userHomeState createState() => _userHomeState();
}

class _userHomeState extends State<userHome> {
  String selectedType = 'buy';
  User _firebaseUser = FirebaseAuth.instance.currentUser;
  String paddyType = 'paddy';

  var purchase = false;
  var sell = false;

  var samba = false;
  var nadu = false;
  var keeri = false;

  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => setting()),
            );
          },
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "StorEsy",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ]);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // //
            // FirebaseFirestore.instance
            //     .collection('User_farmer')
            //     .doc(_firebaseUser.displayName)
            //     .collection("ID")
            //     .doc("ID").set({
            //   'PurchaseID': 10000,
            //   'SellingID' :10000,
            //
            // });
            // FirebaseFirestore.instance
            //     .collection('User_farmer')
            //     .doc(_firebaseUser.displayName)
            //     .collection("Stock")
            //     .doc("Stock").set({
            //   'SambaStock': 0,
            // });

            changeRoute();
          },

          child: const Icon(Icons.account_balance),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[600],
        appBar: appBar2,
        body: Column(children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeTransactionType("Purchase");
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                //color: Colors.blue[600],
                                image: DecorationImage(
                                  image: AssetImage('android/images/buy1.png'),
                                ),
                                // borderRadius:
                                //     BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Purchase",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.blue[600]),
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                              child: (selectedType == "Purchase")
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.blue[600],
                                      size: 35,
                                    )
                                  : Container(),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeTransactionType("sell");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                //color: Colors.blue[600],
                                image: DecorationImage(
                                  image: AssetImage('android/images/sell.png'),
                                ),
                                //borderRadius:
                                // BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Sell",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.blue[600]),
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: (selectedType == "sell")
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.blue[600],
                                      size: 35,
                                    )
                                  : Container(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Select Paddy Type",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changePaddyType("Samba");
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: (paddyType == "Samba")
                              ? BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue.withOpacity(0.4)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                          child: Center(
                            child: Text(
                              "Samba",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: (paddyType == "Samba")
                                      ? Colors.blue[600]
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changePaddyType("Nadu");
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: (paddyType == "Nadu")
                              ? BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue.withOpacity(0.3)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                          child: Center(
                            child: Text(
                              "Nadu",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: (paddyType == "Nadu")
                                      ? Colors.blue[600]
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changePaddyType("Keeri");
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: (paddyType == "Keeri")
                              ? BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue.withOpacity(0.3)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                          child: Center(
                            child: Text(
                              "Keeri",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: (paddyType == "Keeri")
                                      ? Colors.blue[600]
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    child: Text(
                      'Selected Extras',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Container(
                              height: 60,
                              width: 148,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Calcualtor()),
                                  );
                                },
                                icon: Icon(Icons.calculate_rounded, size: 24),
                                label: Text("CALCULATOR"),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 148,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          historyTransaction()),
                                );
                              },
                              icon: Icon(Icons.history, size: 24),
                              label: Text("HISTORY"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 60,
                              width: 148,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Respond to button press
                                },
                                icon: Icon(
                                  Icons.account_balance,
                                  size: 24,
                                ),
                                label: Text("PRICE"),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 148,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => stock()),
                                );
                              },
                              icon: Icon(Icons.store, size: 24),
                              label: Text("STOCK"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     MaterialButton(
                  //       onPressed: () {},
                  //       color: Colors.blue,
                  //       textColor: Colors.white,
                  //       padding: EdgeInsets.only(
                  //           left: 0, top: 16, right: 0, bottom: 16),
                  //       child: Icon(
                  //         Icons.calculate,
                  //         // Text("Add"),
                  //         size: 40,
                  //       ),
                  //       // padding: EdgeInsets.all(16),
                  //       shape: CircleBorder(),
                  //     ),
                  //     MaterialButton(
                  //       onPressed: () {},
                  //       color: Colors.blue,
                  //       textColor: Colors.white,
                  //       padding: EdgeInsets.only(
                  //           left: 0, top: 16, right: 0, bottom: 16),
                  //       child: Icon(
                  //         Icons.history,
                  //         size: 40,
                  //       ),
                  //       // padding: EdgeInsets.all(16),
                  //       shape: CircleBorder(),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          )
        ]));
  }

  void changeTransactionType(String type) {
    selectedType = type;
    setState(() {});
  }

  void changePaddyType(String paddy) {
    paddyType = paddy;
    setState(() {});
  }
  Future<void> changeRoute() async {

    DocumentSnapshot docCurrent1 = await FirebaseFirestore.instance
        .collection('User_farmer')
        .doc(_firebaseUser.displayName)
        .collection("Stock")
        .doc("Stock").get();
    var sambaStock = docCurrent1.data()['SambaStock'];
    DocumentSnapshot docCurrent = await FirebaseFirestore.instance
        .collection('User_farmer')
        .doc(_firebaseUser.displayName)
        .collection("ID")
        .doc("ID")
        .get();
    int purchaseID = docCurrent.data()['PurchaseID'];
    DocumentSnapshot docCurrent2 = await FirebaseFirestore.instance
        .collection('User_farmer')
        .doc(_firebaseUser.displayName)
        .collection("Price")
        .doc("Price")
        .get();
    double sambaPrice = docCurrent.data()['SambaPrice'];

    int sellingID = docCurrent.data()['SellingID'];

    sambaPrice =sambaPrice*purchaseID;

    print(purchaseID);
    print(sambaStock);
    print(purchaseID);
    print(sambaPrice);

    sellingID = sellingID +1;
    purchaseID = purchaseID+1;


    if (selectedType == "Purchase") {
      if (paddyType == "Samba") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return first(purchaseID,sambaStock,sambaPrice);
        }));
      } else if (paddyType == "Nadu") {
        //nadu
      } else if (paddyType == "Keeri") {
        //keeri
      }
    } else if (selectedType == "sell") {
      if (paddyType == "Samba") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return salefirst();
        }));
      } else if (paddyType == "Nadu") {
        //nadu
      } else if (paddyType == "Keeri") {
        //keeri
      }
    }
  }
}
