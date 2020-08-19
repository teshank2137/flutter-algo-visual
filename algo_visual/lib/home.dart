import 'package:algo_visual/lineae_search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Algorithm\'s'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Searching'),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LinearSearch()));
                      },
                      child: Text('Linear Search'),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Binary Search'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Sorting'),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Bubble Sort'),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Merge Sort'),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Quick Sort'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
