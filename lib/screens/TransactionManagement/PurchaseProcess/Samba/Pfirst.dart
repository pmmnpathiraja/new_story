//import 'dart:html';

import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_story/model/buying.dart';
import 'package:new_story/screens/TransactionManagement/PurchaseProcess/Samba/second.dart';

class first extends StatefulWidget {
  first(this.purchaseID,this.stock,this.avgsambaPrice);
  var purchaseID;
  var stock;
  var avgsambaPrice;

  @override
  _firstState createState() => _firstState();
  int CurrentStock() {
    int stock = 23;
    return stock;
  }
}

// ignore: camel_case_types
class _firstState extends State<first> {
  // ignore: non_constant_identifier_names
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  BuyingData buyingData = BuyingData();
  double samba_Price = 54.50;
  double number_Of_kilos = 0;
  int number_of_paddy_bags = 0;
  late String numm;

  double total = 0;

  late String number_Of_kilo;
  var kiloNumber = <double>[];
  var paddyBagNumber = <int>[];
  var totalWeight = <double>[]; //int one = 5;
  //int two = 10;

  double sub_total_kg = 0;
  int sub_paddy_bags = 0;
  double sub_total = 0;
  int instance = 0;

  void get_Number_of_kilos() {
    setState(() {
      number_Of_kilo = controller1.text;
      number_Of_kilos = double.parse(number_Of_kilo);
      print(number_Of_kilos);
    });
  }

  void get_paddy_bags() {
    setState(() {
      numm = controller2.text;
      number_of_paddy_bags = int.parse(numm);
    });
  }

  // ignore: non_constant_identifier_names
  void samba_Price_calc() {
    setState(() {
      samba_Price = samba_Price + 0.50;
      // samba_Price = samba_Price.toDouble();
    });
  }

  void samba_Price_calcd() {
    setState(() {
      samba_Price = samba_Price - 0.50;
      // samba_Price = samba_Price.toDouble();
    });
  }

  void get_total() {
    setState(() {
      total = number_Of_kilos * samba_Price;
    });
  }

  void sub_cal() {
    setState(() {
      if (number_of_paddy_bags != 0 && number_Of_kilos != 0) {
        sub_paddy_bags = sub_paddy_bags + number_of_paddy_bags;
        kiloNumber.add(number_Of_kilos);
        sub_total_kg = sub_total_kg + number_Of_kilos;
        paddyBagNumber.add(number_of_paddy_bags);
        sub_total = sub_total + total;
        totalWeight.add(total);
        instance = instance + 1;
        number_of_paddy_bags = 0;
        number_Of_kilos = 0;
      }
    });
  }
  Future<void> nextPage() async {

    buyingData.totalWeight = totalWeight;
    buyingData.paddyBagNumber = paddyBagNumber;
    buyingData.kiloNumber = kiloNumber;
    buyingData.sub_total_kg = sub_total_kg;
    buyingData.sub_total = sub_total;
    buyingData.sub_paddy_bags = sub_paddy_bags;
    buyingData.samba_Price = samba_Price;
    buyingData.purchaseID = widget.purchaseID;
    buyingData.stock = widget.stock + sub_total_kg;
    buyingData.avgSambaPrice = widget.avgsambaPrice;
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => sub_total != 0
              ? second(buyingData)
              : first(widget.purchaseID,widget.stock,widget.avgsambaPrice)),
    );
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    setState(() {
      controller1.clear();
      controller2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: new Text("Calculator"),
        ),
        //AppBar
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => second()),
        //     );
        //   },
        //   child: const Icon(Icons.navigate_next),
        //   backgroundColor: Colors.blue,
        // ),
        // appBar: AppBar(
        //   centerTitle: true,
        //   elevation: 0.0,
        //   title: Text(
        //     "Enter Transaction Details",
        //     style: TextStyle(
        //       fontSize: 20,
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.blue[100],
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(25, 20, 20, 15),
                    height: 210,
                    width: 350,
                    margin: EdgeInsets.only(
                        top: 0.0, bottom: 0, left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage("android/images/back2.jpg"),
                      // ),
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(30.0),

                      // gradient: LinearGradient(
                      //   colors: [
                      //     Colors.blueAccent.withOpacity(0.1),
                      //     Colors.black.withOpacity(0.7),
                      //   ],
                      // ),
                    ),
                  )),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.indigoAccent, Colors.blueAccent]),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Column(
                          children: [
                            Row(children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("Current Stock (KG)"),
                                margin: EdgeInsets.fromLTRB(15, 30, 0, 0),
                              ),
                              Container(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text("RS"),
                                  ),
                                  margin: EdgeInsets.fromLTRB(190, 30, 0, 0)),
                            ]),
                            Row(
                              children: <Widget>[
                                Container(
                                    //alignment: Alignment.topLeft,
                                    child: Text(
                                      "${widget.stock}", //this should be a variable
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                    margin: EdgeInsets.fromLTRB(15, 2, 0, 0)),
                                Container(
                                    child: Text(
                                      "$samba_Price",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                    margin: EdgeInsets.fromLTRB(110, 2, 0, 0))
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text.rich(TextSpan(
                                      text: "Price of ",
                                      style: TextStyle(fontSize: 15),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "SAMBA",
                                            style: TextStyle(fontSize: 18)),
                                      ])),
                                  margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                ),
                                // Container(
                                //   padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                //   margin: EdgeInsets.fromLTRB(160, 20, 0, 0),
                                //   child: Text(
                                //     "+3.5%",
                                //     style: TextStyle(color: Colors.white),
                                //   ),
                                //   decoration: BoxDecoration(
                                //     color: Colors.green,
                                //     borderRadius: BorderRadius.circular(30.0),
                                //   ),
                                // )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    samba_Price.toString(),
                                    // ("5450"),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                  margin: EdgeInsets.fromLTRB(15, 4, 0, 0),
                                ),
                                // TextFormField(
                                //   decoration: InputDecoration(
                                //       hintText: "54",
                                //       hintStyle: TextStyle(
                                //           color: Colors.white, fontSize: 25)),
                                // ),

                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Text(
                                    "/=",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ),
                                //
                                //
                                // FloatingActionButton(
                                //   onPressed: () {},
                                //   child: const Icon(Icons.plus_one),
                                //   backgroundColor: Colors.red,

                                //
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    width: 30,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: FloatingActionButton(
                                          heroTag: "btn2",
                                          onPressed: () {
                                            samba_Price_calc();
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          backgroundColor: Colors.red,
                                        ))),

                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    width: 30,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: FloatingActionButton(
                                          heroTag: "btn1",
                                          onPressed: () {
                                            samba_Price_calcd();
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                          backgroundColor: Colors.red,
                                        ))),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Please input data",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(50, 10, 42, 0),
                      child: Text(
                        "Number of Kilos (Kg)",
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 40,
                      width: 83,
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                              width: 3,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 3))),
                        keyboardType: TextInputType.number,
                        controller: controller1,
                        textAlign: TextAlign.center,
                        // validator: (String value) {
                        //                   if (value.isEmpty) {
                        //                     return "Contact is not entered";
                        //                   }
                        //                   return null;
                        //                 },
                        //obscureText: false,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              // Container(
              //   height: 20,
              //   width: 40,
              //   child: TextField(
              //       //obscureText: false,
              //       ),
              // ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(50, 10, 25, 0),
                      child: Text(
                        "Number of Paddy Bags",
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 83,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                              width: 3,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 3))),
                        keyboardType: TextInputType.number,
                        controller: controller2,
                        textAlign: TextAlign.center,
                        validator: (var value) {
                          if (value!.isEmpty) {
                            return "Enter Paddy Bags";
                          }
                          return null;
                        },

                        //obscureText: false,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child: Text(
                      "Total",
                      style: TextStyle(color: Colors.grey[600], fontSize: 18),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(170, 10, 0, 0),
                      child: Text.rich(TextSpan(
                          text: "RS.",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: total.toString()),
                            TextSpan(text: "/="),
                            //This should be a variable
                          ])))
                ],
              )),
              Container(
                  margin: EdgeInsets.fromLTRB(230, 5, 0, 0),
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlatButton(
                      onPressed: () {
                        get_Number_of_kilos();
                        get_total();
                        get_paddy_bags();
                      },
                      child: Text("Total"))),
              SizedBox(
                height: 40,
              ),

              Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sub Total",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                  padding: EdgeInsets.all(13),
                  //height: 50,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            instance.toString(), //This should be a variable
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                            child: Text.rich(TextSpan(
                                text: sub_total_kg
                                    .toString(), //This should be a variable
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]),
                                children: <TextSpan>[
                              TextSpan(text: "KG"),
                            ]))),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          child: Text(
                            sub_paddy_bags.toString(),
                            //This should be a variable
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                            child: Text.rich(TextSpan(
                                text: "RS.",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]),
                                children: <TextSpan>[
                              TextSpan(text: sub_total.toString()),
                              //This should be a variable
                              TextSpan(text: "/=")
                            ]))),
                      ],
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 10, 30, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () {
                                sub_cal();
                                dispose();
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[600]),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                onPressed: () =>nextPage(),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Receipt",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey[600]),
                                  ),
                                ),
                              )))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
