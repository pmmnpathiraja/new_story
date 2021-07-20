import 'package:flutter/material.dart';

class stock extends StatefulWidget {
  @override
  _stockState createState() => _stockState();
}

class _stockState extends State<stock> {
  var _stockType = ['SAMBA', 'NADU', 'KEERI'];
  var _currentStockType = 'SAMBA';

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
                        "54.21",
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
                        "15214",
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
          child: Container(
            child: DataTable(
              columnSpacing: 8,
              horizontalMargin: 10,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Farmer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "P Type",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Quantity',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Value',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('2021.05.23')),
                    DataCell(Text('Somapala')),
                    DataCell(Text('Samba')),
                    DataCell(Text('152')),
                    DataCell(Text('14522')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('2021.05.23')),
                    DataCell(Text('Perera R.P')),
                    DataCell(Text('Samba')),
                    DataCell(Text('152')),
                    DataCell(Text('14522')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('2021.05.23')),
                    DataCell(Text('KiriBanda')),
                    DataCell(Text('Nadu')),
                    DataCell(Text('152')),
                    DataCell(Text('14522')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('2021.05.23')),
                    DataCell(Text('KiriBanda')),
                    DataCell(Text('Samba')),
                    DataCell(Text('152')),
                    DataCell(Text('14522')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('2021.05.23')),
                    DataCell(Text('KiriBanda')),
                    DataCell(Text('Nadu')),
                    DataCell(Text('152')),
                    DataCell(Text('14522')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('2021.05.23')),
                    DataCell(Text('KiriBanda')),
                    DataCell(Text('Samba')),
                    DataCell(Text('152')),
                    DataCell(Text('14522')),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
