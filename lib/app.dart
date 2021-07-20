import 'package:flutter/material.dart';
import 'package:new_story/_routing/routes.dart';
import 'package:new_story/_routing/router.dart' as router;
import 'package:new_story/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Informer',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      onGenerateRoute: router.generateRoute,
      initialRoute: landingViewRoute,
    );
  }
}
