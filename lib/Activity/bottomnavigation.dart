import 'package:flutter/material.dart';
import 'package:flutter_app/Activity/second.dart';
import 'package:flutter_app/Activity/third.dart';

void main() => runApp(BottomPageViewDemo());

class BottomPageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: PageViewDemo1(),
      ),
    );
  }
}

class PageViewDemo1 extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo1> {


  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> _list(){
    return[
      BottomNavigationBarItem(icon: new Icon(Icons.home),title: new Text('First')),
      BottomNavigationBarItem(icon: new Icon(Icons.search),title: new Text('Second')),
      BottomNavigationBarItem(icon: new Icon(Icons.search),title: new Text('Third'))];
  }
  PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget buildpager() {
    return PageView(
      controller: _controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        MyPage1Widget(),
        ThirdScreen(),
        MyPage3Widget(),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text("Sample")
  ),
  body: buildpager(),
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: bottomSelectedIndex,
    onTap: (index) {
      bottomTapped(index);
    },
    items: _list(),
  ),

);
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }
}

class MyPage1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: [
              MyBox(darkGreen, height: 50),
            ],
          ),
          Row(
            children: [
              MyBox(lightGreen),
              MyBox(lightGreen),
            ],
          ),
          MyBox(mediumGreen, text: 'PageView 1'),
          Row(
            children: [
              MyBox(lightGreen, height: 200),
              MyBox(lightGreen, height: 200),
            ],
          ),
        ],
      ),
    );
  }
}

class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkBlue, height: 50),
            MyBox(darkBlue, height: 50),
          ],
        ),
        Row(
          children: [
            MyBox(lightBlue),
            MyBox(lightBlue),
          ],
        ),
        MyBox(mediumBlue, text: 'PageView 2'),
        Row(
          children: [
            MyBox(lightBlue),
            MyBox(lightBlue),
          ],
        ),
      ],
    );
  }
}

class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkRed),
            MyBox(darkRed),
          ],
        ),
        MyBox(mediumRed, text: 'PageView 3'),
        Row(
          children: [
            MyBox(lightRed),
            MyBox(lightRed),
            MyBox(lightRed),
          ],
        ),
      ],
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;

class MyBox extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  MyBox(this.color, {this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        color: color,
        height: (height == null) ? 50 : height,
        child: (text == null) ? null
            : Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 50,

              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}