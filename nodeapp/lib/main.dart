import 'package:flutter/material.dart';
import './home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Key class is used to uniquely identify widgets
  const MyApp({Key? key}) : super(key: key);

  // a method in a subclass is intended to override a method with the same name in its superclass.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
