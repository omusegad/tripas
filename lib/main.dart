import 'package:flutter/material.dart';
import 'package:tripas/pages/trips.dart';
import 'package:tripas/routes/router.dart';
import 'package:tripas/routes/router_const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeRouter,
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      home: Trips(),
    );
  }
}
