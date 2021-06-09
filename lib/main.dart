import 'package:flutter/material.dart';
import 'app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: kMainRoute,
      routes: kRoutes,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,
    );
  }
}
