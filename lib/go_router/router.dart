// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';

/// This sample app shows an app with two screens.
///
/// The first route '/' is mapped to [HomeScreen], and the second route
/// '/details' is mapped to [DetailsScreen].
///
/// The buttons use context.go() to navigate to each destination. On mobile
/// devices, each destination is deep-linkable and on the web, can be navigated
/// to using the address bar.

/// The route configuration.

/// The main app.

/// The home screen
class HomeScreen extends StatefulWidget {
  /// Constructs a [HomeScreen]
  ///
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          bottom: TabBar(controller: _tabController, tabs: const [
            Tab(text: 'Home'),
            Tab(text: 'Second'),
          ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: Column(
                children: [
                  TextField(
                    focusNode: _focusNode,
                    textInputAction: TextInputAction.done,
                    // onEditingComplete: () => _focusNode.unfocus(),
                    // Other properties...
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/details'),
                    child: const Text('Home Screen Button'),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                // onPressed: () => Navigator.of(context).pushNamed('/details'),
                onPressed: () => context.go('/details'),
                child: const Text('Go to the Second screen'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  DetailsScreen({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Details Screen')),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () => context.go('/'),
  //         child: const Text('Go back to the Home screen'),
  //       ),
  //     ),
  //   );
  // }
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'School',
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // context.go('/myWidget');
                  // GoRouter.of(context).go('/myWidget');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyWidget(),
                      ));
                },
                child: Text('Go'))
          ],
        ),
      ),
      // body: ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.red,
      //         height: context.sized.height * 0.1,
      //         width: context.sized.width,
      //       ),
      //     ),

      //     // Expanded(
      //     //   child: ListView.builder(
      //     //       padding: const EdgeInsets.all(8),
      //     //       itemCount: entries.length,
      //     //       itemBuilder: (BuildContext context, int index) {
      //     //         return Container(
      //     //           height: 50,
      //     //           child: Center(child: Text('Entry ${entries[index]}')),
      //     //         );
      //     //       }),
      //     // ),
      //   ],
      // ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('skdahskdlasgdsd'),
        leading: IconButton(
            onPressed: () {
              // context.pop('/details');
              // Navigator.pop(context);
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.abc)),
      ),
    );
  }
}
