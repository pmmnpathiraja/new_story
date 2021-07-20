import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:ffi';

import 'package:new_story/screens/TransactionManagement/SaleProcess/Samba/BillCal.dart';

class salefirst extends StatefulWidget {
  @override
  _salefirstState createState() => _salefirstState();
}

// ignore: camel_case_types
class _salefirstState extends State<salefirst> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();
  TextEditingController controller7 = new TextEditingController();
  TextEditingController controller8 = new TextEditingController();
  TextEditingController controller9 = new TextEditingController();
  TextEditingController controller10 = new TextEditingController();
  TextEditingController controller11 = new TextEditingController();
  TextEditingController controller12 = new TextEditingController();
  TextEditingController controller13 = new TextEditingController();
  TextEditingController controller14 = new TextEditingController();
  TextEditingController controller15 = new TextEditingController();
  TextEditingController controller16 = new TextEditingController();
  TextEditingController controller17 = new TextEditingController();
  TextEditingController controller18 = new TextEditingController();
  TextEditingController controller19 = new TextEditingController();
  TextEditingController controller20 = new TextEditingController();

  double number_of_kilos1 = 0;
  double number_of_kilos2 = 0;
  double number_of_kilos3 = 0;
  double number_of_kilos4 = 0;
  double number_of_kilos5 = 0;
  double number_of_kilos6 = 0;
  double number_of_kilos7 = 0;
  double number_of_kilos8 = 0;
  double number_of_kilos9 = 0;
  double number_of_kilos10 = 0;

  int numm1 = 0;
  int numm2 = 0;
  int numm3 = 0;
  int numm4 = 0;
  int numm5 = 0;
  int numm6 = 0;
  int numm7 = 0;
  int numm8 = 0;
  int numm9 = 0;
  int numm10 = 0;

  double total_kilo = 0;

  int total_paddy_bags = 0;

  double sub_total_kg = 0;
  int sub_paddy_bags = 0;

  int instance = 0;

  void get_total_kilo() {
    setState(() {
      total_kilo = number_of_kilos1 +
          number_of_kilos2 +
          number_of_kilos3 +
          number_of_kilos4 +
          number_of_kilos5 +
          number_of_kilos6 +
          number_of_kilos7 +
          number_of_kilos8 +
          number_of_kilos9 +
          number_of_kilos10;
      number_of_kilos1 = 0;
      number_of_kilos2 = 0;
      number_of_kilos3 = 0;
      number_of_kilos4 = 0;
      number_of_kilos5 = 0;
      number_of_kilos6 = 0;
      number_of_kilos7 = 0;
      number_of_kilos8 = 0;
      number_of_kilos9 = 0;
      number_of_kilos10 = 0;
    });
  }

  void get_paddy_bags_and_get_number_of_kilos() {
    setState(() {
      /**1**************************************************************/
      if (controller1.text.isNotEmpty && controller2.text.isNotEmpty) {
        number_of_kilos1 = double.parse(controller1.text);
        numm1 = int.parse(controller2.text);
      }
      // if (controller1.text.isNotEmpty || controller2.text.isNotEmpty) {
      //   numm1 = 0;
      //   number_of_kilos1 = 0;
      // }
      /**2***************************************************************/
      if (controller3.text.isNotEmpty && controller4.text.isNotEmpty) {
        number_of_kilos2 = double.parse(controller3.text);
        numm2 = int.parse(controller4.text);
      }
      // if (controller3.text.isNotEmpty || controller4.text.isNotEmpty) {
      //   numm2 = 0;
      //   number_of_kilos2 = 0;
      // }
      /***3**************************************************************/
      if (controller5.text.isNotEmpty && controller6.text.isNotEmpty) {
        number_of_kilos3 = double.parse(controller5.text);
        numm3 = int.parse(controller6.text);
      }
      // if (controller5.text.isNotEmpty || controller6.text.isNotEmpty) {
      //   numm3 = 0;
      //   number_of_kilos3 = 0;
      // }
      /****4*************************************************************/
      if (controller7.text.isNotEmpty && controller8.text.isNotEmpty) {
        number_of_kilos4 = double.parse(controller7.text);
        numm4 = int.parse(controller8.text);
      }
      // if (controller7.text.isNotEmpty || controller8.text.isNotEmpty) {
      //   numm4 = 0;
      //   number_of_kilos4 = 0;
      // }
      /*****5************************************************************/
      if (controller9.text.isNotEmpty && controller10.text.isNotEmpty) {
        number_of_kilos5 = double.parse(controller9.text);
        numm5 = int.parse(controller10.text);
      }
      // if (controller9.text.isNotEmpty || controller10.text.isNotEmpty) {
      //   numm5 = 0;
      //   number_of_kilos5 = 0;
      // }
      /******6***********************************************************/
      if (controller11.text.isNotEmpty && controller12.text.isNotEmpty) {
        number_of_kilos6 = double.parse(controller11.text);
        numm6 = int.parse(controller12.text);
      }
      // if (controller11.text.isNotEmpty || controller12.text.isNotEmpty) {
      //   numm6 = 0;
      //   number_of_kilos6 = 0;
      // }
      /*******7**********************************************************/
      if (controller13.text.isNotEmpty && controller14.text.isNotEmpty) {
        number_of_kilos7 = double.parse(controller13.text);
        numm7 = int.parse(controller14.text);
      }
      // if (controller13.text.isNotEmpty || controller14.text.isNotEmpty) {
      //   numm7 = 0;
      //   number_of_kilos7 = 0;
      // }
      /********8*********************************************************/
      if (controller15.text.isNotEmpty && controller16.text.isNotEmpty) {
        number_of_kilos8 = double.parse(controller15.text);
        numm8 = int.parse(controller16.text);
      }
      // if (controller15.text.isNotEmpty || controller16.text.isNotEmpty) {
      //   numm8 = 0;
      //   number_of_kilos8 = 0;
      // }
      /*********9********************************************************/
      if (controller17.text.isNotEmpty && controller18.text.isNotEmpty) {
        number_of_kilos9 = double.parse(controller17.text);
        numm9 = int.parse(controller18.text);
      }
      // if (controller17.text.isNotEmpty || controller18.text.isNotEmpty) {
      //   numm9 = 0;
      //   number_of_kilos9 = 0;
      // }
      /**********10*******************************************************/
      if (controller19.text.isNotEmpty && controller20.text.isNotEmpty) {
        number_of_kilos10 = double.parse(controller19.text);
        numm10 = int.parse(controller20.text);
      }
      // if (controller19.text.isNotEmpty || controller20.text.isNotEmpty) {
      //   numm10 = 0;
      //   number_of_kilos10 = 0;
      // }
    });
  }

  void get_total_paddy_bags() {
    setState(() {
      total_paddy_bags = numm1 +
          numm2 +
          numm3 +
          numm4 +
          numm5 +
          numm6 +
          numm7 +
          numm8 +
          numm9 +
          numm10;
      numm1 = 0;
      numm2 = 0;
      numm3 = 0;
      numm4 = 0;
      numm5 = 0;
      numm6 = 0;
      numm7 = 0;
      numm8 = 0;
      numm9 = 0;
      numm10 = 0;
    });
  }

  void sub_cal() {
    setState(() {
      if(total_paddy_bags != 0 && total_kilo != 0) {
        sub_paddy_bags = sub_paddy_bags + total_paddy_bags;
        sub_total_kg = sub_total_kg + total_kilo;
        total_paddy_bags = 0;
        total_kilo = 0;
        instance = instance + 1;
      }
    });
  }

  void dispose() {
    setState(() {
      controller1.clear();
      controller2.clear();
      controller3.clear();
      controller4.clear();
      controller5.clear();
      controller6.clear();
      controller7.clear();
      controller8.clear();
      controller9.clear();
      controller10.clear();
      controller11.clear();
      controller12.clear();
      controller13.clear();
      controller14.clear();
      controller15.clear();
      controller16.clear();
      controller17.clear();
      controller18.clear();
      controller19.clear();
      controller20.clear();
      //total_paddy_bags.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 3,
          title: Text('Sales Process - Samba'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 70, top: 5, right: 20),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Kilos (Kg)",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 100, top: 5, right: 20),
                        child: Container(
                          child: Text(
                            "Paddy Bags",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "01",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller1,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller2,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "02",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller3,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller4,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "03",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller5,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller6,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "04",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller7,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller8,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "05",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller9,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller10,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "06",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller11,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller12,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "07",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller13,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller14,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "08",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller15,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller16,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "09",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller17,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller18,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "10",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 40,
                        width: 130,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller19,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 5, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: Colors.purple,
                          //   width: 5,
                          // ),
                          color: Colors.grey[400],
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
                                      color: Colors.blue, width: 3))),
                          keyboardType: TextInputType.number,
                          controller: controller20,
                          textAlign: TextAlign.center,

                          //obscureText: false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: Container(
                        child: Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, top: 10),
                      child: Container(
                          child: Text.rich(TextSpan(
                        text: total_kilo.toString(), //This should be a variable
                        style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                      ))),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Container(
                          child: Text.rich(TextSpan(
                        text: total_paddy_bags
                            .toString(), //This should be a variable
                        style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                      ))),
                    ),
                    //
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(200, 5, 0, 0),
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlatButton(
                      onPressed: () {
                        get_paddy_bags_and_get_number_of_kilos();
                        get_total_kilo();
                        get_total_paddy_bags();
                      },
                      child: Text("Total"))),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 8),
                child: Container(
                    child: Align(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: Text(
                      "Sub Total",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
              ),
              Container(
                  padding: EdgeInsets.only(left: 30, top: 8),
                  //height: 50,

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
                                fontSize: 18, color: Colors.grey[600]),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                              child: Text.rich(TextSpan(
                            text: sub_total_kg
                                .toString(), //This should be a variable
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[600]),
                          ))),
                        ),
                        SizedBox(
                          width: 160,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            child: Text(
                              sub_paddy_bags
                                  .toString(), //This should be a variable
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[600]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 10, 30, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 18),
                        child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
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
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 18),
                        child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => billCal()),
                                    );
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Receipt",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey[600]),
                                    ),
                                  ),
                                ))),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
