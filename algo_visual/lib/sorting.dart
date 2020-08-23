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
  bool stop = false;
  double speed = 100;

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
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Min Speed',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kTextBackground),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                  child: Slider(
                    value: speed,
                    //label: _range.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        speed = value;
                      });
                    },
                    activeColor: lHighlight,
                    inactiveColor: Color(0xffffde03),
                    min: 1,
                    max: 400000,
                    divisions: 400000,
                  ),
                ),
                Text(
                  'Max Speed',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kTextBackground),
                ),
              ],
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
                    stop = true;
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
                  setState(() {
                    stop = false;
                  });
                  switch (widget.title) {
                    case 'Bubble Sort':
                      {
                        bubbleSort();
                      }
                      break;

                    case 'Selection Sort':
                      {
                        setState(() {
                          selectionSort();
                        });
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
          opList.insert(i, buildColumn(list[i], lSecondary, 10));
          opList.removeAt(i + 1);
          opList.insert(i + 1, buildColumn(list[i + 1], lSecondary, 10));
        });
        await Future.delayed(Duration(microseconds: (speed).toInt()));
        if (list[i] <= list[i + 1]) {
        } else {
          swap(list, i, i + 1);
          setState(() {
            opList.removeAt(i);
            opList.insert(i, buildColumn(list[i], lHighlight, 10));
            opList.removeAt(i + 1);
            opList.insert(i + 1, buildColumn(list[i + 1], lHighlight, 10));
          });
          setState(() {
            swap(opList, i, i + 1);
          });
          await Future.delayed(Duration(microseconds: (speed).toInt()));
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

  void updatePointers(List listOp, Color color) {
    setState(() {
      opList.removeAt(listOp[0]);
      opList.insert(listOp[0], buildColumn(list[listOp[0]], color, 12));
      opList.removeAt(listOp[1]);
      opList.insert(listOp[1], buildColumn(list[listOp[1]], color, 12));
    });
  }

  void selectionSort() async {
    for (int i = 0; i < list.length - 1; i++) {
      if (stop) break;
      // Find the minimum element in unsorted number
      int minIdx = i;
      //setUpdateText('Finding minimum');
      for (int j = i + 1; j < list.length; j++) {
        if (stop) break;
        updatePointers([i, j], lSecondary);
        await Future.delayed(Duration(microseconds: (speed ~/ 1.5).toInt()));
        opList.removeAt(j);
        opList.insert(j, buildColumn(list[j], lPrimary, 10));
        if (list[j] < list[minIdx]) {
          opList.removeAt(minIdx);
          opList.insert(minIdx, buildColumn(list[minIdx], lPrimary, 10));
          minIdx = j;
          opList.removeAt(minIdx);
          opList.insert(minIdx, buildColumn(list[minIdx], lHighlight, 12));
        }
      }

      // Swap the found minimum element with the first element
      //await Future.delayed(Duration(milliseconds: 250));
      setState(() {
        opList.removeAt(minIdx);
        opList.insert(minIdx, buildColumn(list[minIdx], kTextBackground, 10));
        opList.removeAt(i);
        opList.insert(i, buildColumn(list[i], kTextBackground, 10));
      });
      if (stop) break;
      await Future.delayed(Duration(microseconds: (speed).toInt()));
      swap(list, minIdx, i);
      swap(opList, minIdx, i);
      setState(() {
        opList.removeAt(minIdx);
        opList.insert(minIdx, buildColumn(list[minIdx], lPrimary, 10));
        opList.removeAt(i);
        opList.insert(i, buildColumn(list[i], lSuccess, 10));
      });
    }
    var i = list.length - 2;
    opList.removeAt(list.length - 2);
    opList.insert(i, buildColumn(list[i], lSuccess, 10));
    opList.removeAt(i + 1);
    opList.insert(i + 1, buildColumn(list[i + 1], lSuccess, 10));
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
