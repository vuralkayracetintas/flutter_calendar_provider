import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:kartal/kartal.dart';

class OrbitDemo3 extends StatefulWidget {
  @override
  _OrbitDemo3State createState() => _OrbitDemo3State();
}

class _OrbitDemo3State extends State<OrbitDemo3> {
  double _angle1 = 0.0;
  double _angle2 = 0.0;

  @override
  void initState() {
    super.initState();

    // Animasyonları başlat
    startOrbitAnimation();
  }

  void startOrbitAnimation() {
    // Timer'ları kullanarak orbit animasyonlarını çalıştır
    Timer.periodic(Duration(milliseconds: 16), (timer) {
      setState(() {
        _angle1 += 0.01; // İlk orbit açısını artır
      });
    });

    Timer.periodic(Duration(milliseconds: 16), (timer) {
      setState(() {
        _angle2 += 0.02; // İkinci orbit açısını artır (farklı hızda)
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height / 2;
    double radius1 = 150.0; // İlk orbit yarıçapı
    double radius2 = 200.0; // İkinci orbit yarıçapı
    double radius3 = 100.0;
    double imageWidth = 100.0; // Resmin genişliği
    double imageHeight = 100.0; // Resmin yüksekliği

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image(
                  image: AssetImage('assets/lg.png'),
                  width: context.sized.width * 0.8,
                ),
                CustomPaint(
                  size: Size(300, 300), // Çizim alanının boyutunu ayarlayın
                  painter: OrbitPainter(
                    angle1: _angle1,
                    angle2: _angle2,
                    radius1: radius1,
                    radius2: radius2,
                    radius3: radius3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrbitPainter extends CustomPainter {
  final double angle1;
  final double angle2;
  final double radius1;
  final double radius2;
  final double radius3;

  OrbitPainter({
    required this.angle1,
    required this.angle2,
    required this.radius1,
    required this.radius2,
    required this.radius3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // İlk orbit çizgisi
    final paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius1, paint1);

    // İkinci orbit çizgisi
    final paint2 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius2, paint2);
    final paint3 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius3, paint3);

    // Orbitleri dönen kutular
    for (int i = 0; i < 4; i++) {
      final x1 = center.dx + radius1 * cos(angle1 + i * 2 * pi / 4);
      final y1 = center.dy + radius1 * sin(angle1 + i * 2 * pi / 4);
      final x2 = center.dx + radius2 * cos(angle2 + i * 2 * pi / 4);
      final y2 = center.dy + radius2 * sin(angle2 + i * 2 * pi / 4);

      final paint = Paint()
        ..color = i.isEven ? Colors.red : Colors.blue
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x1, y1), 25, paint);
      canvas.drawCircle(Offset(x2, y2), 25, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
