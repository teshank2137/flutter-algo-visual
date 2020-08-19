import 'package:flutter/material.dart';
import 'home.dart';
import 'lineae_search.dart';

class MyDropdownmenu extends StatefulWidget {
  String value;
  MyDropdownmenu(this.value);
  @override
  _MyDropdownmenuState createState() => _MyDropdownmenuState();
}

class _MyDropdownmenuState extends State<MyDropdownmenu> {
  @override
  Widget build(BuildContext context) {
    var dropdownValue = widget.value;
    return DropdownButton(
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_down),
      dropdownColor: Colors.black,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.white),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          print(dropdownValue);
          if (dropdownValue == 'All') {
            print('im in');
            Navigator.pop(context);
          } else if (dropdownValue == 'Linear Search') {
            print('Im in linear search');
          }
        });
      },
      items: <String>[
        'All',
        'Linear Search',
        'Binary Search',
        'Bubble Sort',
        'Merge Sort',
        'Quick Sort'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
