import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tests/pages/my_home_page.dart';

void main() {
  runZonedGuarded(() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    runApp(MyApp());
  }, (Object error, StackTrace stack) {});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
