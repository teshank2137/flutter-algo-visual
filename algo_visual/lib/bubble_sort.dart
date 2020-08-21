import 'dart:math';
import 'color.dart';
import 'package:algo_visual/main.dart';
import 'package:flutter/material.dart';

class BubbleSort extends StatefulWidget {
  @override
  _BubbleSortState createState() => _BubbleSortState();
}

double _range = 20;

List generateRandomList(double range) {
  List list = [];
  var rng = new Random();
  for (var i = 0; i < range; i++) {
    list.add(rng.nextInt(100) * 2 + 4);
  }
  return list;
}

List list = generateRandomList(_range);
List opList = buildList(list, Color(0xff0336ff));
List<Widget> buildList(List list, Color color) {
  List<Widget> opList = [];
  for (var i = 0; i < list.length; i++) {
    opList.add(buildColumn(list[i], color, opList.length));
  }
  return opList;
}

Widget buildColumn(var ht, Color color, var range) {
  return Padding(
    padding: const EdgeInsets.all(2.5),
    child: Container(
      height: ht,
      color: color,
      width: 10,
    ),
  );
}

class _BubbleSortState extends State<BubbleSort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: appBar('Bubble Sort'),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bubble Sort',
                style: TextStyle(
                  color: kTextBackground,
                  fontFamily: 'SourceSansPro',
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 205,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: opList,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Slider(
                value: _range,
                label: _range.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _range = value;
                    list = generateRandomList(_range);
                    opList = buildList(list, Color(0xff0336ff));
                  });
                },
                activeColor: lHighlight,
                inactiveColor: Color(0xffffde03),
                min: 20,
                max: 50,
                divisions: 5,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text(
                  'Reset',
                  style: TextStyle(
                      color: kTextBackground, fontWeight: FontWeight.bold),
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(Radius.circular(20))),
                splashColor: Color(0xffff0266),
                onPressed: () {
                  setState(() {
                    list = generateRandomList(_range);
                    opList = buildList(list, Color(0xff0336ff));
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  'Sort',
                  style: TextStyle(
                      color: kTextBackground, fontWeight: FontWeight.bold),
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(Radius.circular(20))),
                color: Color(0xffff0266),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
