import 'package:algo_visual/home.dart';
import 'package:flutter/material.dart';
import 'dropdown.dart';
import 'color.dart';

void main() {
  runApp(MyApp());
}

Widget appBar(String value) {
  return AppBar(
    backgroundColor: kBackground.withOpacity(0.97),
    elevation: 1.0,
    leading: Icon(
      Icons.code,
      color: kTextBackground,
    ),
    title: Text(
      'Algorithm Visualiser',
      style: TextStyle(
        color: kTextBackground,
        fontWeight: FontWeight.normal,
      ),
    ),
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
      backgroundColor: Colors.grey[100],
      appBar: appBar('All'),
      body: HomePage(),
    );
  }
}
