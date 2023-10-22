import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class Orbit extends StatefulWidget {
  @override
  _Orbit createState() => _Orbit();
}

class _Orbit extends State<Orbit> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    controller.repeat(min: 0.0, max: 1.0, period: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: controller,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.red,
                  ),
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
            RotationTransition(
              turns: controller,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blue,
                  ),
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
            RotationTransition(
              turns: controller,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.red,
                  ),
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
            RotationTransition(
              turns: controller,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blue,
                  ),
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
