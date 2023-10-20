import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

class LottieDemo extends StatelessWidget {
  const LottieDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const CircularProgressIndicator(),
            Lottie.asset(
              'assets/lg.json',
              height: context.sized.width * 0.4,
            )
          ],
        ),
      ),
    );
  }
}
