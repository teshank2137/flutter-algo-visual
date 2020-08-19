import 'package:algo_visual/home.dart';
import 'package:flutter/material.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
}

Widget appBar(String value) {
  return AppBar(
    leading: Icon(Icons.code),
    title: Text('Algorithm Visualiser'),
    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 40, 8),
        child: MyDropdownmenu(value),
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('All'),
      body: HomePage(),
    );
  }
}
