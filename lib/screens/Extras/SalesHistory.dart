import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class salesHistory extends StatefulWidget {
  salesHistory(this.needDate);
  DateTime needDate;
  @override
  _salesHistoryState createState() => _salesHistoryState();
}

class _salesHistoryState extends State<salesHistory> {
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
    //         'Sales History',
    //         style: Theme.of(context).textTheme.headline6,
    //       ),
    //     ),
    //   ]),
    // );

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
              'Value',
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
              DataCell(Text('145022')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('Perera Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('11102')),
              DataCell(Text('362500')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('SK Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('11020')),
              DataCell(Text('254610')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('WD Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('15102')),
              DataCell(Text('475110')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('Bandara Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('15221')),
              DataCell(Text('145220')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2021.05.23')),
              DataCell(Text('KiriBanda Rice Mills')),
              DataCell(Text('Samba')),
              DataCell(Text('15002')),
              DataCell(Text('145212')),
            ],
          ),
        ],
      )),
    );
  }
}
