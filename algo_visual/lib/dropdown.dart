import 'package:flutter/material.dart';
import 'color.dart';
import 'searching.dart';
import 'sorting.dart';

// ignore: must_be_immutable
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
      dropdownColor: lPrimary,
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
          } else if (newValue == 'Bubble Sort' &&
              dropdownValue != 'Bubble Sort') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sorting(newValue)),
            );
          } else if (newValue == 'Merge Sort' &&
              dropdownValue != 'Merge Sort') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sorting(newValue)),
            );
          } else if (newValue == 'Quick Sort' &&
              dropdownValue != 'Quick Sort') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sorting(newValue)),
            );
          } else if (newValue == 'Insertion Sort' &&
              dropdownValue != 'Insertion Sort') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sorting(newValue)),
            );
          } else if (newValue == 'Selection Sort' &&
              dropdownValue != 'Selection Sort') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sorting(newValue)),
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
        'Selection Sort',
        'Insertion Sort',
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
