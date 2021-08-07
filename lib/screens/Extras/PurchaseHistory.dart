import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class purchaseHistory extends StatefulWidget {
  purchaseHistory(this.needDate);
  DateTime needDate;
  @override
  _purchaseHistoryState createState() => _purchaseHistoryState();
}

class _purchaseHistoryState extends State<purchaseHistory> {
  final dateTime = DateTime.now();
  User _firebaseUser = FirebaseAuth.instance.currentUser;
  double quantity = 0;
  double total = 0;
  bool validator = false;
  @override
  void initState() {
    super.initState();
    validator = false;
    loadData().whenComplete(() {
      setState(() {
        if (quantity != 0 && total != 0) {
          validator = true;
        }
      });
    });
  }

  Future<void> loadData() async {
    await FirebaseFirestore.instance
        .collection('User_farmer')
        .doc(_firebaseUser.displayName)
        .collection("Transaction_details_farmer")
        .orderBy('Date')
        .startAt([widget.needDate])
        .endAt([dateTime])
        .get()
        .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            // String timeString = doc['Date'].toDate().toString();
            // String afterDate = timeString.split(" ")[0];
            // print(afterDate);
            // print(doc["Farmer Name"]);
            quantity = quantity + (doc["Number of Kilo"]);
            total = total + (doc["total"]);
          });
        })
        .whenComplete(() {
          setState(() {
            if (quantity != 0 && total != 0) {
              validator = true;
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
   // print("awaaaaaaaaaaaaaaaaaaa");
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
    return Scaffold(
        body: Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('User_farmer')
                    .doc(_firebaseUser.displayName)
                    .collection("Transaction_details_farmer")
                    .orderBy('Date')
                    .startAt([widget.needDate]).endAt([dateTime]).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  if (!snapshot.hasData)
                    return Container(
                        child: Center(
                            child: Text(
                      'No Purchase History from ${dateTime.toString().split(" ")[0]}',
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
                              'No Purchase History from ${dateTime.toString().split(" ")[0]}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )))
                          : DataTable(
                              columnSpacing: 10,
                              horizontalMargin: 10,
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'Date',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Farmer",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "P Type",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Quantity',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Value',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                            DataCell(Text(element['Farmer Name']
                                                .toString())),
                                            DataCell(Text(element['Paddy Type']
                                                .toString())),
                                            DataCell(Text(
                                                element['Number of Kilo']
                                                    .toString())),
                                            DataCell(Text(
                                                element['total'].toString())),
                                          ],
                                        )),
                                  )
                                  .toList(),
                            );
                  }
                }),
            SizedBox(
              height: 20,
            ),
            validator == true
                ? Container(
                    child: Text(
                    ' Total Quantity     -->  ${quantity}KG',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                : Container(),
            SizedBox(
              height: 10,
            ),
            validator == true
                ? Container(
                    child: Text(
                    ' Total Purchase   -->  RS.$total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                : Container(),
          ]),
    ));
  }
}
