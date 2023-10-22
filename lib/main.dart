import 'package:demo_apps/animation/lotie_demo.dart';
import 'package:demo_apps/animation/orbit_animation/orbit_2.dart';
import 'package:demo_apps/animation/orbit_animation/orbit_3.dart';
import 'package:demo_apps/animation/orbit_animation/orbit_4.dart';

import 'package:demo_apps/animation/orbit_animation/orbit_animation.dart';
import 'package:demo_apps/page_controller/page_controller_view.dart';
import 'package:demo_apps/provider/event_provider.dart';
import 'package:demo_apps/qrcode/qrcode_scanner.dart';

import 'package:demo_apps/singlechild_button/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      title: 'My App',
      home: OrbitDemo3(),
    );
  }
}
