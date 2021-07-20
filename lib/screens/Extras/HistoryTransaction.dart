import 'package:flutter/material.dart';
import 'package:new_story/screens/Extras/PurchaseHistory.dart';

import 'ProfitHistory.dart';
import 'SalesHistory.dart';

class historyTransaction extends StatefulWidget {
  @override
  _historyTransactionState createState() => _historyTransactionState();
}

class _historyTransactionState extends State<historyTransaction> {
  @override
  Widget build(BuildContext context) {
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {},
            ),
          ],
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
        body: TabBarView(
          children: [
            purchaseHistory(),
            salesHistory(),
            profitHistory(),
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
