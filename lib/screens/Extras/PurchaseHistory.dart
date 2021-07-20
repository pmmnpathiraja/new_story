import 'package:flutter/material.dart';

class purchaseHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
