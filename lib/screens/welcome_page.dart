import 'dart:async';

import 'package:rick_morty/screens/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
            child: Column(children: [
          SizedBox(height: 300),
          Container(
            width: width * 0.6,
            height: width * 0.6,
            child: Image.asset(
              "assets/rick.jpeg",
              fit: BoxFit.contain,
            ),
          ),
          button1('Welcome', HomePage()),
        ])));
  }

  Widget button1(String name, Widget page) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(name,
            style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 63, 201, 255),
                fontWeight: FontWeight.w600)));
  }
}
