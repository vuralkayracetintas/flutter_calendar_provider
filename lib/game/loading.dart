import 'dart:async';
import 'package:flutter/material.dart';
import 'game.dart';

class SplashScreenoyun extends StatefulWidget {
  const SplashScreenoyun({Key? key}) : super(key: key);

  @override
  _SplashScreenoyunState createState() => _SplashScreenoyunState();
}

class _SplashScreenoyunState extends State<SplashScreenoyun> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 380), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => BoardWidget()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here

            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
            SizedBox(
              height: 200,
            ),
            Text(
              "x",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.red, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
