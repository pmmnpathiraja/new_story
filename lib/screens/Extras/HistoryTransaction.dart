import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_story/screens/Extras/PurchaseHistory.dart';

import 'ProfitHistory.dart';
import 'SalesHistory.dart';

class historyTransaction extends StatefulWidget {
  historyTransaction(this.needDate);
  DateTime needDate;
  @override
  _historyTransactionState createState() => _historyTransactionState();
}

class _historyTransactionState extends State<historyTransaction> {
  final dateTime = DateTime.now();
  void timeChangingToday(){
    final dateTime = DateTime.now();
    widget.needDate = dateTime.subtract(Duration(hours: dateTime.hour));
    print(dateTime);
    print(dateTime.hour);
    print(widget.needDate);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              historyTransaction(widget.needDate)),
    );
  }
  void timeChangingThisWeek(){
    final dateTime = DateTime.now();
    widget.needDate = dateTime.subtract(Duration(hours: dateTime.hour));
    widget.needDate = widget.needDate.subtract(Duration(days: 7));
    print(dateTime);
    print(dateTime.hour);
    print(widget.needDate);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              historyTransaction(widget.needDate)),
    );
  }
  void timeChangingThisMonth(){
    final dateTime = DateTime.now();
    widget.needDate = dateTime.subtract(Duration(hours: dateTime.hour));
    widget.needDate = widget.needDate.subtract(Duration(days: (dateTime.day-1)));
    print(dateTime);
    print(dateTime.hour);
    print(widget.needDate);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              historyTransaction(widget.needDate)),
    );
  }
  void timeChangingSixMonth(){
    final dateTime = DateTime.now();
    widget.needDate = dateTime.subtract(Duration(hours: dateTime.hour));
    widget.needDate = widget.needDate.subtract(Duration(days: 183));
    print(dateTime);
    print(dateTime.hour);
    print(widget.needDate);                                Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              historyTransaction(widget.needDate)),
    );

  }

  void timeChangingOneYear(){
    final dateTime = DateTime.now();
    widget.needDate = dateTime.subtract(Duration(hours: dateTime.hour));
    widget.needDate = widget.needDate.subtract(Duration(days: 365));
    print(dateTime);
    print(dateTime.hour);
    print(widget.needDate);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              historyTransaction(widget.needDate)),
    );
  }


  @override
  Widget build(BuildContext context) {
    //print("000000000000000000000000000000000000000000000000");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              title: Text('Transaction History'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.add_business),
                    text: 'Purchases',
                  ),
                  Tab(
                    icon: Icon(Icons.send),
                    text: 'Sales',
                  ),
                  Tab(
                    icon: Icon(Icons.money),
                    text: 'Profits',
                  )
                ],
              ),
            ),
            endDrawer: Drawer(
                child: ListView(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('ToDay'),
                    onTap: () =>timeChangingToday(),
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: Text('This Week'),
                    onTap: () =>timeChangingThisWeek(),
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: Text('This Month'),
                    onTap: () =>timeChangingThisMonth(),
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: Text('Six month'),
                    onTap: () =>timeChangingSixMonth(),
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: Text('One Year'),
                    onTap: () =>timeChangingOneYear(),
                  ),
                ])),

            body: TabBarView(
              children: [
                purchaseHistory(this.widget.needDate),
                salesHistory(this.widget.needDate),
                profitHistory(this.widget.needDate),
              ],
            ),
          ),
        ));
  }
}

// Widget buildTransactionLabel() {
//   final columns = ['Date', 'Transaction ID', 'Name', 'Amount'];

//   // return DataTable(
//   //   columns: getColumns(columns),
//   // );
// }
