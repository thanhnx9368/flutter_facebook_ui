import 'package:flutter/material.dart';
import 'package:flutter_facebook/constants/palette.dart';
import 'package:flutter_facebook/screens/home_screen.dart';
import 'package:flutter_facebook/screens/nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Palette.scaffold,
          brightness: Brightness.light),
      home: NavScreen(),
    );
  }
}
