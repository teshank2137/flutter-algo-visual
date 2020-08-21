import 'dart:math';
import 'color.dart';
import 'package:algo_visual/main.dart';
import 'package:flutter/material.dart';

class Sorting extends StatefulWidget {
  @override
  _SortingState createState() => _SortingState();
  final String title;
  Sorting(this.title);
}

class _SortingState extends State<Sorting> {
  double _range = 20;
  List list;
  List<Widget> opList;
  double _delay = 0.1;
  bool stop = false;

  @override
  void initState() {
    super.initState();
    list = generateRandomList(_range);
    opList = buildList(list, lPrimary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: appBar(widget.title),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
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
              height: 305,
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
                max: 80,
                divisions: 10,
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
                onPressed: () {
                  setState(() {
                    stop = true;
                  });
                },
                child: Text(
                  'Stop',
                  style: TextStyle(
                      color: kTextBackground, fontWeight: FontWeight.bold),
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(Radius.circular(20))),
                splashColor: Color(0xffff0266),
              ),
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
                    stop = true;
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
                  setState(() {
                    stop = false;
                  });
                  switch (widget.title) {
                    case 'Bubble Sort':
                      {
                        bubbleSort();
                      }
                      break;

                    case 'Merge Sort':
                      {
                        //statements;
                      }
                      break;
                    case 'Quick Sort':
                      {
                        //statements;
                      }
                      break;

                    default:
                      {
                        //statements;
                      }
                      break;
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void bubbleSort() async {
    var n = list.length - 1;
    var i = 0;
    while (n != 0) {
      if (stop) {
        break;
      }
      if (i < n) {
        setState(() {
          opList.removeAt(i);
          opList.insert(i, buildColumn(list[i], lSecondary, 12));
          opList.removeAt(i + 1);
          opList.insert(i + 1, buildColumn(list[i + 1], lSecondary, 12));
        });
        await Future.delayed(Duration(seconds: (_delay).toInt()));
        if (list[i] <= list[i + 1]) {
        } else {
          swap(list, i, i + 1);
          setState(() {
            swap(opList, i, i + 1);
          });
        }
        setState(() {
          opList.removeAt(i);
          opList.insert(i, buildColumn(list[i], lPrimary, 10));
          opList.removeAt(i + 1);
          opList.insert(i + 1, buildColumn(list[i + 1], lPrimary, 10));
        });
        i++;
      } else {
        setState(() {
          opList.removeAt(i);
          opList.insert(i, buildColumn(list[i], lSuccess, 10));
        });
        n = n - 1;
        i = 0;
      }
    }
    if (!stop) {
      opList.removeAt(0);
      opList.insert(0, buildColumn(list[0], lSuccess, 10));
    }
  }

  List generateRandomList(double range) {
    List list = [];
    var rng = new Random();
    for (var i = 0; i < range; i++) {
      list.add(rng.nextInt(150) * 2 + 4);
    }
    return list;
  }

  List<Widget> buildList(List list, Color color) {
    List<Widget> opList = [];
    for (var i = 0; i < list.length; i++) {
      opList.add(buildColumn(list[i], color, 10));
    }
    return opList;
  }

  Widget buildColumn(var ht, Color color, var width) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        height: ht,
        color: color,
        width: width,
      ),
    );
  }

  void swap(List list, var i, var j) {
    var temp = list[j];
    list[j] = list[i];
    list[i] = temp;
  }
}
