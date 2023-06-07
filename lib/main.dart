import 'package:flutter/material.dart';
import 'package:wheather_appnew/scr/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: homescreen());
    //  home: Homescreen(),
  }
}
