import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Activity/Cardview%20Design.dart';
import 'package:flutter_app/Activity/LoginScreen.dart';
import 'package:flutter_app/Activity/pagerdemo.dart';
import 'package:flutter_app/Activity/second.dart';
import 'package:flutter_app/Activity/third.dart';

import '../models/choice.dart';
import 'bottomnavigation.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter GridView Demo"),
            ),
            body: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: (1 / .9),
                shrinkWrap: true,
                padding: EdgeInsets.all(2),
                children: List.generate(choices.length, (index) {
                  return Container(
                      child: Card(
                          margin: EdgeInsets.all(5.0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: InkWell(
                            onTap: () {
                              print(choices[index]);
                              if (index == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SecondScreen(choic1: choices[index]),
                                    ));
                              } else if (index == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ThirdScreen(),
                                    ));
                              } else if (index == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PageViewDemo(),
                                    ));
                              } else if (index == 3) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BottomPageViewDemo(),
                                    ));
                              } else if (index == 4) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Cardviewdesign(choic1: choices[index]),
                                    ));
                              } else if (index==5){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                        child: Icon(choices[index].icon,
                                            size: 50.0, color: Colors.black)),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(choices[index].title,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black)),
                                      ),
                                    )
                                    // Text(choices[index].title, textAlign: Alignment.center  ,style: TextStyle(fontSize: 15,color: Colors.black,)),
                                  ]),
                            ),
                          )));
                }))));
  }
}
