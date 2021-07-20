import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:new_story/screens/TransactionManagement/SaleProcess/RegisterMiller.dart';

class billCal extends StatefulWidget {
  @override
  _billCalState createState() => _billCalState();
}

class _billCalState extends State<billCal> {
  TextEditingController controller1 = new TextEditingController();

  double stock_price = 54;

  double purchase_price = 0;
  double quantity = 10000;
  double unit_price = 0;
  double divid = 64;

  late String purchase_prices;

  double sub_total = 0;
  double profit = 0;

  void get_purchase_price() {
    setState(() {
      purchase_prices = controller1.text;

      purchase_price = double.parse(purchase_prices);
      print(purchase_price);
    });
  }

  void unit_price_calc() {
    setState(() {
      unit_price = purchase_price / divid;
    });
  }

  void get_sub_total() {
    setState(() {
      sub_total = quantity * unit_price;
    });
  }

  void profit_cal() {
    setState(() {
      profit = (unit_price - stock_price) * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Navigator.push(
        //     //   // context,
        //     //   // MaterialPageRoute(builder: (context) => registerFarmer()),
        //     // );
        //   },
        //   child: const Icon(Icons.navigate_next),
        //   backgroundColor: Colors.blue,
        // ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "Selling Process",
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          // bottom: PreferredSize(
          //     child: Padding(
          //       padding: const EdgeInsets.only(bottom: 8.0),
          //       child: Text(
          //         "ID 12345481",
          //         style: TextStyle(
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
          //     preferredSize: Size.fromHeight(18)),
        ),
        body: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 30, bottom: 18),
                child: Container(
                  height: 40,
                  child: Text(
                    'Enter Selling Price :',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70.0, top: 30, bottom: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40,
                  width: 120,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                          width: 3,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3))),
                    keyboardType: TextInputType.number,
                    controller: controller1,
                    textAlign: TextAlign.center,

                    //obscureText: false,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  height: 40,
                  child: Text(
                    'Price of 01 KG :',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140.0),
                child: Container(
                    child: Text.rich(TextSpan(
                        text: unit_price.toString(), //This should be a variable
                        style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                        children: <TextSpan>[
                      TextSpan(text: "/="),
                    ]))),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.fromLTRB(225, 5, 0, 0),
              height: 35,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: FlatButton(
                  onPressed: () {
                    //get_Number_of_kilos();
                    get_purchase_price();
                    unit_price_calc();
                    profit_cal();
                    get_sub_total();
                    //get_sub_total();
                  },
                  child: Text("Next"))),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: 500,
              height: 230,
              decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(width: 3, color: Colors.blue)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0, left: 38),
                        child: Text(
                          "Total Quantity",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0, left: 38),
                        child: Text(
                          quantity
                              .toString(), //This should be the toral comes from previous page
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0),
                        child: Text(
                          " KG",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0, left: 38),
                        child: Text(
                          "Sub Total",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0, left: 80),
                        child: Text(
                          sub_total.toString(), //This should be a variable
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0),
                        child: Text(
                          " /=",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0, left: 38),
                        child: Text(
                          "Profit/Loss",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0, left: 70),
                        child: Text(
                          profit
                              .toString(), //This should be the toral comes from previous page
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0),
                        child: Text(
                          " /=",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "Thank You!", //This should be a variable
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 30, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: <Widget>[
                  Container(
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () {
                            //sub_cal();
                            //dispose();
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[600]),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                      width: 130,
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
                                    builder: (context) => registerMiller()),
                              );
                            },
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
        ]));
  }
}
