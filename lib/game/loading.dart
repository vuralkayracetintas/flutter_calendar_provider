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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here

            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
            const SizedBox(
              height: 200,
            ),
            const Text(
              "Yıllık Eğitim Maliyetini %70 İndir!",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.red, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
