import 'package:demo_apps/bottom_nav_bar.dart/bottom_nav_bar_view.dart';
import 'package:flutter/material.dart';

class SchoolPage extends StatelessWidget {
  const SchoolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Page'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchoolPageDetails()));
                  },
                  child: Text('evennts'))
            ],
          )
        ],
      ),
    );
  }
}

class SchoolPageDetails extends StatelessWidget {
  const SchoolPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School details'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(),
              TextButton(onPressed: () {}, child: Text('evennts'))
            ],
          )
        ],
      ),
    );
  }
}
