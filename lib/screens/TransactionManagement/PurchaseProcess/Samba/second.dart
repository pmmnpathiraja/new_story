import 'package:flutter/material.dart';
import 'package:new_story/model/buying.dart';
import 'package:new_story/screens/TransactionManagement/PurchaseProcess/Samba/Pfirst.dart';
import 'package:new_story/screens/TransactionManagement/PurchaseProcess/Samba/RegisterFarmer.dart';
import 'package:new_story/screens/TransactionManagement/PurchaseProcess/Samba/RegisterValidation.dart';

class second extends StatefulWidget {
  second(this.buyingData)
      : super();
  BuyingData buyingData;
  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
  late final List<Map<String, String>> listOfColumns;

  @override
  void initState() {
    super.initState();
    listOfColumns = [
      for (int i = 0; i < widget.buyingData.kiloNumber.length; ++i)
        {
          "Quantity": widget.buyingData.kiloNumber[i].toString(),
          "Paddy Bags": widget.buyingData.paddyBagNumber[i].toString(),
          "Value": widget.buyingData.totalWeight[i].toString(),
        }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterValidation(widget.buyingData)),
            );
          },
          child: const Icon(Icons.navigate_next),
          backgroundColor: Colors.blue,
        ),
        appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              "Transaction Details",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "ID ${widget.buyingData.purchaseID}",
                  ),
                ),
                preferredSize: Size.fromHeight(18)),
            actions: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15, right: 5.0),
                    //width: 30,
                    // height: 50,
                    child: Text(
                      "${widget.buyingData.samba_Price}", //varibale to set purchased price
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, right: 5.0),
                    child: Text(
                      "/=",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ]),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Center(
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Quantity.')),
                  DataColumn(label: Text('Paddy Bags')),
                  DataColumn(label: Text('Value')),
                ],
                // rows: [
                //   DataRow(cells: [
                //     DataCell(Text('120')),
                //     DataCell(Text('3')),
                //     DataCell(Text('5250'))
                //   ]),
                // ],
                rows:
                    listOfColumns.map // Loops through dataColumnText, each iteration assigning the value to element
                        (
                          ((element) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(element['Quantity'] as String)), //Extracting from Map element the value
                                  DataCell(Text(element['Paddy Bags'] as String)),
                                  DataCell(Text(element['Value'] as String)),
                                ],
                              )),
                        )
                        .toList(),
              ),
            ),
            // SizedBox(
            //   height: 0,
            // ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Sub Total",
                    style: TextStyle(
                        color: Colors.blue[500],
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
                padding: EdgeInsets.all(12),
                //height: 50,
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "${widget.buyingData.totalWeight.length}.", //This should be a variable
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            child: Text.rich(TextSpan(
                                text: "${widget.buyingData.sub_total_kg}", //This should be a variable
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(text: "KG"),
                            ]))),
                        SizedBox(
                          width: 40,
                          height: 50,
                        ),
                        Container(
                          child: Text(
                            "${widget.buyingData.sub_paddy_bags}", //This should be a variable
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                            child: Text.rich(TextSpan(
                                text: "RS.",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  text: "${widget.buyingData.sub_total}"), //This should be a variable
                              TextSpan(text: "/=")
                            ]))),
                      ],
                    ))),
          ],
        )));
  }
}
