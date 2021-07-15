import 'dart:io';
import 'package:flutter/material.dart';
import '../models/choice.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: SecondScreen(),
  ));
}

class SecondScreen extends StatelessWidget{
  final Choice choic1;
  SecondScreen({Key key, @required this.choic1}) : super(key: key);
//  SecondScreen(Choice choic, {this.choic1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(choic1.title)),
      body: Container(
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(choic1.title),
            ),
            Container(

              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 250,
                            child: Image.network(
                                'https://static.javatpoint.com/tutorial/flutter/images/flutter-creating-android-platform-specific-code3.png',
                                height: 100,
                                width: 250,
                              fit: BoxFit.fill,
                            ),

                        ),
                      ),
                    ),
                    Text(choic1.title),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(choic1.title),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
