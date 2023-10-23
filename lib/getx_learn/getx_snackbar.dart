import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class GetxSnackbar extends StatelessWidget {
  const GetxSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.snackbar('Snacbar title', 'snacbat title message',
                      // duration: Duration(seconds: 3),
                      // animationDuration: Duration(seconds: 2),
                      isDismissible: true,
                      dismissDirection: DismissDirection.none,
                      forwardAnimationCurve: Curves.easeIn,
                      icon: Icon(Icons.notifications),
                      overlayBlur: 5,
                      overlayColor: Colors.transparent,
                      // showProgressIndicator: true,
                      backgroundGradient: LinearGradient(
                        colors: [Colors.black, Colors.white],
                      ),
                      mainButton: TextButton(
                          onPressed: () {},
                          child: const Text('text button click')));
                },
                child: Text('Click Button ')),
            IconButton(
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                icon: Icon(Icons.ac_unit))
          ],
        ),
      ),
    );
  }
}
