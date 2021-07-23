import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class purchaseHistory extends StatefulWidget {
  purchaseHistory(this.needDate);
  DateTime needDate;
  @override
  _purchaseHistoryState createState() => _purchaseHistoryState();
}

class _purchaseHistoryState extends State<purchaseHistory> {
  void loadData(){
    FirebaseFirestore.instance
        .collection('users')
        .orderBy('age')
        .orderBy('company')
        .startAt([4, 'Alphabet Inc.'])
        .endAt([21, 'Google LLC'])
        .get();
    final dateTime = DateTime.now();
    // needDate = dateTime.subtract(const Duration(days: 7));
    //
    // print(dateTime);
    // print(needDate);
  }
  @override
  Widget build(BuildContext context) {
    print("awaaaaaaaaaaaaaaaaaaa");
    print(widget.needDate);
    // return SafeArea(
    //   child: Column(mainAxisSize: MainAxisSize.min, children: [
    //     Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Text(
    //         'Purchase History',
    //         style: Theme.of(context).textTheme.headline6,
    //       ),
    //     ),
    //   ]),
    // );
    // final double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
          //width: width,
          child: DataTable(
        columnSpacing: 0,
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
              DataCell(Text('Somapala Bandara')),
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
      )),
    );
  }
}
