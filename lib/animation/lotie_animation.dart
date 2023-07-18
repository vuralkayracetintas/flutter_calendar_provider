import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  double opacityLevel = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        opacityLevel = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.grey,
      Colors.yellow,
      Colors.green,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(milliseconds: 1000),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // Image(
              //     height: MediaQuery.of(context).size.height * 0.3,
              //     image: AssetImage('assets/images/akademilogo.png')),
              //const Image(image: AssetImage('assets/images/oua.png')),
              //akademilogo
              const SizedBox(height: 60),
              Text(
                'OYUN VE UYGULAMA AKADEMİSİNE HOŞ \nGELDİN 🚀🚀',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child:
                      Lottie.asset('assets/study.json', fit: BoxFit.contain)),
              const SizedBox(height: 60),
              SizedBox(
                width: 250.0,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      speed: const Duration(milliseconds: 500),
                      'StudyOn',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Bobbers',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Istedigin yerde'),
                      TyperAnimatedText('istedigin zaman,'),
                      TyperAnimatedText('ozgurce calis'),
                      ColorizeAnimatedText(
                        speed: const Duration(milliseconds: 500),
                        'StudyOn',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 20.0, height: 100.0),
                  const Text(
                    'Study',
                    style: TextStyle(fontSize: 43.0),
                  ),
                  const SizedBox(width: 20.0, height: 100.0),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Horizon',
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText(
                          'OFF',
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        RotateAnimatedText(
                          'ON',
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
