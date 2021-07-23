import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class profitHistory extends StatefulWidget {
  profitHistory(this.needDate);
  DateTime needDate;
  @override
  _profitHistoryState createState() => _profitHistoryState();
}

class _profitHistoryState extends State<profitHistory> {
  void loadData(){
    FirebaseFirestore.instance
        .collection('users')
        .orderBy('age')
        .orderBy('company')
        .startAt([4, 'Alphabet Inc.'])
        .endAt([21, 'Google LLC'])
        .get();
    // final dateTime = DateTime.now();
    // needDate = dateTime.subtract(const Duration(days: 7));
    //
    // print(dateTime);
    // print(needDate);
  }
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Column(mainAxisSize: MainAxisSize.min, children: [
    //     Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Text(
    //         'Profit History',
    //         style: Theme.of(context).textTheme.headline6,
    //       ),
    //     ),
    //   ]),
    // );

    return SingleChildScrollView(
      child: Container(
          //width: width,
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
              "Miller",
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
              'Profit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('Danapala Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('15002')),
              DataCell(Text('1022')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('Perera Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('11102')),
              DataCell(Text('2500')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('SK Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('11020')),
              DataCell(Text('4610')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('WD Rice Mills')),
              DataCell(Text('Nadu')),
              DataCell(Text('15102')),
              DataCell(Text('5110')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('Bandara Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('15221')),
              DataCell(Text('5220')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('KiriBanda Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('15002')),
              DataCell(Text('5212')),
            ],
          ),
        ],
      )),
    );
  }
}
