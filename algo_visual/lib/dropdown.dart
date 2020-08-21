import 'package:flutter/material.dart';
import 'color.dart';
import 'linear_search.dart';

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
      dropdownColor: kPrimary700,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.white),
      onChanged: (String newValue) {
        setState(() {
          if (newValue == 'All' && dropdownValue != 'All') {
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          } else if (newValue == 'Linear Search' &&
              dropdownValue != 'Linear Search') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LinearSearch()),
            );
          }
          dropdownValue = newValue;
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
          child: Text(
            value,
            style: TextStyle(color: kTextBackground),
          ),
        );
      }).toList(),
    );
  }
}
