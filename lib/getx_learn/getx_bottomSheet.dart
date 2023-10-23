import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class GetxBottomSheet extends StatelessWidget {
  const GetxBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Show Bottom Sheet'),
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.wb_sunny_outlined),
                            title: Text('Light Theme'),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text('Dark Theme'),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                            },
                          ),
                        ],
                      ),
                    ),
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.green,
                    isDismissible: true);

                // ignore: avoid_print
              },
            )
          ],
        ),
      ),
    );
  }
}
