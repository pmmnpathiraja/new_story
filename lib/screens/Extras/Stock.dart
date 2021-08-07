import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class stock extends StatefulWidget {
  stock(this.stockData, this.priceData);
  DocumentSnapshot stockData;
  DocumentSnapshot priceData;
  @override
  _stockState createState() => _stockState();
}

class _stockState extends State<stock> {
  var _stockType = ['Samba', 'Nadu', 'Keeri'];
  var _currentStockType = 'Samba';
  User _firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Current Stock'),
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Colors.blue[400],
          ),
          child: Container(
            height: 230,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: DropdownButton<String>(
                        underline: Container(
                          height: 1,
                          color: Colors.blue,
                        ),
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        iconSize: 40,
                        items: _stockType
                            .map(
                              (String dropDownStringItem) =>
                                  DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              ),
                            )
                            .toList(),
                        onChanged: (var newValueSelected) {
                          //code to execute when drop down item is selected
                          setState(() {
                            this._currentStockType = newValueSelected!;
                          });
                        },
                        value: _currentStockType,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Stock Price (Rs)",
                      style: TextStyle(fontSize: 20, color: Colors.grey[300]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${widget.priceData[_currentStockType + 'Price']}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Current Stock (KG)",
                      style: TextStyle(fontSize: 20, color: Colors.grey[300]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${widget.stockData[_currentStockType + 'Stock']}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 18,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 2.0, right: 25.0, left: 25.0),
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
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 2),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Latest Transactions",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(2.0),
            child: SingleChildScrollView(
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('User_farmer')
                      .doc(_firebaseUser.displayName)
                      .collection("Transaction_details_farmer").where("Paddy Type", isEqualTo: _currentStockType)
                      .orderBy('Date')
                      .startAt([
                    DateTime.now().subtract(Duration(days: 190))
                  ]).endAt([DateTime.now()]).snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    if (!snapshot.hasData)
                      return Container(
                          child: Center(
                              child: Text(
                        'No Profit History from ${DateTime.now().toString().split(" ")[0]}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text('Loading...');
                      default:
                        return snapshot.data!.docs.isEmpty
                            ? Container(
                                child: Center(
                                    child: Text(
                                'No Profit History from ${DateTime.now().toString().split(" ")[0]}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )))
                            : DataTable(
                                columnSpacing: 10,
                                horizontalMargin: 10,
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Miller",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "P Type",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Quantity',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Profit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                                rows: snapshot.data!.docs
                                    .map // Loops through dataColumnText, each iteration assigning the value to element
                                    (
                                      ((element) => DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text(element['Date']
                                                      .toDate()
                                                      .toString()
                                                      .split(" ")[
                                                  0])), //Extracting from Map element the value
                                              DataCell(Text(
                                                  element['Farmer Name']
                                                      .toString())),
                                              DataCell(Text(
                                                  element['Paddy Type']
                                                      .toString())),
                                              DataCell(Text(
                                                  element['Number of Kilo']
                                                      .toString())),
                                              DataCell(Text(element['total']
                                                  .toString())),
                                            ],
                                          )),
                                    )
                                    .toList(),
                              );
                    }
                  },
                ),
              ),
            ))
      ]),
    );
  }
}
