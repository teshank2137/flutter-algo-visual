import 'dart:math';

import 'package:algo_visual/main.dart';
import 'package:flutter/material.dart';

class LinearSearch extends StatefulWidget {
  @override
  _LinearSearchState createState() => _LinearSearchState();
}

class _LinearSearchState extends State<LinearSearch> {
  List list = genrateRandomList();
  final _search = TextEditingController();
  bool isValid = false;

  void _handelSubmit(String text) {
    //TODO main algorithm
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Linear Search'),
      body: ListView(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Linear Search'),
          )),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildList(list),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _search,
            onChanged: (String text) {
              isValid = text.length > 0;
            },
            onSubmitted: isValid ? _handelSubmit : null,
            decoration: InputDecoration.collapsed(hintText: 'Input a number'),
          ),
          Row(
            children: [
              FlatButton(
                child: Text('Reset'),
                onPressed: () {
                  setState(() {
                    list = genrateRandomList();
                  });
                },
              ),
              RaisedButton(
                child: Text('Search'),
                onPressed: () {
                  _handelSubmit(_search.text);
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
}

List genrateRandomList() {
  List list = [];
  var rng = new Random();
  for (var i = 0; i < 10; i++) {
    list.add(rng.nextInt(100) * 2 + 4);
  }
  return list;
}

List<Widget> buildList(List list) {
  List<Widget> newList = [];
  for (var i = 0; i < list.length; i++) {
    newList.add(_buildSizedBox(list[i]));
  }
  return newList;
}

Widget _buildSizedBox(var i) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      width: 50,
      color: Colors.grey,
      child: Text(i.toString()),
    ),
  );
}
