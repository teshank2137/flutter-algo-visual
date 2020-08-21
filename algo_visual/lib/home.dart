import 'package:algo_visual/color.dart';
import 'package:algo_visual/linear_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'bubble_sort.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      child: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Algorithm\'s',
                style: TextStyle(
                  color: kTextBackground,
                  fontFamily: 'SourceSansPro',
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Searching',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextPrimary.withOpacity(0.90),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: kPrimary700,
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LinearSearch()));
                          },
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Linear Search',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextPrimary,
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: kPrimary,
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Binary Search',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextPrimary,
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: kPrimary,
                        ),
                      ],
                    ),
                    SizedBox(width: 12.0),
                    Column(
                      children: [
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Sorting',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextPrimary.withOpacity(0.90),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: kPrimary700,
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BubbleSort()),
                            );
                          },
                          child: Container(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Bubble Sort',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextPrimary,
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: kPrimary,
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Merge Sort',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextPrimary,
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: kPrimary,
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Quick Sort',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextPrimary,
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: kPrimary,
                        ),
                      ],
                    ),
                    /*SizedBox(width: 12.0),
                    Column(
                      children: [
                        Text('Path Finding #TODO'),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BubbleSort()),
                            );
                          },
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Bubble Sort',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: kPrimary,
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Merge Sort',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xff0336ff),
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Quick Sort',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xff0336ff),
                        ),
                      ],
                    ),
                    SizedBox(width: 12.0),
                    Column(
                      children: [
                        Text('Data Structures #TODO'),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BubbleSort()),
                            );
                          },
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Bubble Sort',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xff0336ff),
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Merge Sort',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xff0336ff),
                        ),
                        FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(10))),
                          onPressed: () {},
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                'Quick Sort',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xff0336ff),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
