import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[

  const Choice(title: 'Intent', icon: Icons.home),
  const Choice(title: 'Extra', icon: Icons.contacts),
  const Choice(title: 'ViewPager', icon: Icons.map),
  const Choice(title: 'Bottom navigation', icon: Icons.ac_unit_outlined),
  const Choice(title: 'Cardview Design', icon: Icons.camera_alt),
  const Choice(title: 'Login Screen', icon: Icons.settings),
  const Choice(title: 'Album', icon: Icons.photo_album),
  const Choice(title: 'WiFi', icon: Icons.wifi),
  const Choice(title: 'ade', icon: Icons.title),
  const Choice(title: 'rf', icon: Icons.ac_unit_outlined),
  const Choice(title: 'we', icon: Icons.access_alarm_rounded),

];