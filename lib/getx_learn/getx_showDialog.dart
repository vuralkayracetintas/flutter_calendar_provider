import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class GetxShowDialog extends StatelessWidget {
  const GetxShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      barrierDismissible: false,
                      title: 'Show Dialog Title',
                      textConfirm: 'Confirm',
                      textCancel: 'Cancel',
                      middleText: 'Show dialog middle text',
                      onConfirm: () {
                        Get.back();
                      },
                      onCancel: () {
                        Get.back();
                      },
                      backgroundColor: Colors.red);
                },
                child: const Text('text'))
          ],
        ),
      ),
    );
  }
}
