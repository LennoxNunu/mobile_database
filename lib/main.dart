import 'package:flutter/material.dart';
import 'package:mobile_database/app/locator.dart';
import 'package:mobile_database/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctors File',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.welcomeView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
