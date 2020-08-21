import 'dart:async';
import 'dart:math';
import 'color.dart';

import 'package:algo_visual/main.dart';
import 'package:flutter/material.dart';

class LinearSearch extends StatefulWidget {
  @override
  _LinearSearchState createState() => _LinearSearchState();
}

class _LinearSearchState extends State<LinearSearch> {
  List<int> list;
  List<Widget> opList;
  final _search = TextEditingController();
  bool isValid = false;
  double _delay = 2;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    list = genrateRandomList();
    opList = buildList(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackground,
      appBar: appBar('Linear Search'),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Linear Search',
                style: TextStyle(
                  color: kTextBackground,
                  fontFamily: 'SourceSansPro',
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: opList,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              width: 200,
              child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20, color: kTextBackground),
                  textAlign: TextAlign.center,
                  controller: _search,
                  onChanged: (String text) {
                    isValid = text.length > 0;
                  },
                  onSubmitted: isValid ? linearSearch : null,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kTextBackground,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Search here",
                    hintStyle: TextStyle(color: kTextBackground),
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text(
                  'Reset',
                  style: TextStyle(color: kTextBackground),
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(Radius.circular(20))),
                splashColor: kPrimary,
                onPressed: () {
                  setState(() {
                    _search.clear();
                    list = genrateRandomList();
                    opList = buildList(list);
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: kTextPrimary, fontWeight: FontWeight.bold),
                ),
                color: kPrimary,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.all(Radius.circular(20))),
                onPressed: () {
                  linearSearch(_search.text);
                  setState(() {
                    isValid = false;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void linearSearch(String text) async {
    //TODO main algorithm
    int num = int.parse(text);
    var i = 0;
    while (i < list.length) {
      //looking at

      opList.removeAt(i);
      opList.insert(i, _buildSizedBox(list[i], kPrimary, 60));
      await Future.delayed(Duration(seconds: (_delay ~/ 2).toInt()));
      if (num == list[i]) {
        setState(() {
          opList.removeAt(i);
          opList.insert(i, _buildSizedBox(list[i], kError, 70));
          i++;
        });
        break;
      } else {
        setState(() {
          opList.removeAt(i);
          opList.insert(i, _buildSizedBox(list[i], Colors.blueGrey, 50));
          i++;
        });
      }
    }
  }

  List genrateRandomList() {
    List<int> list = [];
    var rng = new Random();
    for (var i = 0; i < 10; i++) {
      list.add(rng.nextInt(100) * 2 + 4);
    }
    return list;
  }

  List<Widget> buildList(List<int> list) {
    List<Widget> newList = [];
    for (var i = 0; i < list.length; i++) {
      newList.add(_buildSizedBox(list[i], kPrimary, 50));
    }
    return newList;
  }

  Widget _buildSizedBox(var i, Color color, double size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          height: size,
          width: size,
          color: color,
          child: Center(
              child: Text(
            i.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
