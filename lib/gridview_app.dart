import 'package:flutter/material.dart';

class DemoGrid extends StatelessWidget {
  const DemoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFE5E5E5),
                border: Border.all(
                  color: const Color(0xFFA5A5A3),
                ),
              ),
              child: TextButton.icon(
                icon: const Icon(
                  Icons.calendar_month,
                  size: 40,
                ),
                label: const Text(
                  'Takvim',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () async {
                  // if (FirebaseAuth.instance.currentUser != null) {
                  //   NavigationService.instance
                  //       .navigateToPage(path: NavigationConstants.calendarPage);
                  // } else {
                  //   await showDialog(
                  //       context: context,
                  //       builder: (context) {
                  //         return AlertDialog(
                  //           title: const Text('Önce hesap açmalısınız'),
                  //           content: const SingleChildScrollView(
                  //             child: ListBody(
                  //               children: <Widget>[
                  //                 Text(
                  //                     'Bu özelliği kullanabilmeniz için önce hesap açmalısınız.'),
                  //               ],
                  //             ),
                  //           ),
                  //           actions: <Widget>[
                  //             TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: const Text('Devam et')),
                  //             TextButton(
                  //               child: const Text('Hesap aç'),
                  //               onPressed: () {
                  //                 // NavigationService.instance
                  //                 //     .navigateToPageRemoveAll(
                  //                 //         path: NavigationConstants.loginPage);
                  //               },
                  //             ),
                  //           ],
                  //         );
                  //       });
                  // }
                },
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFE5E5E5),
                border: Border.all(
                  color: const Color(0xFFA5A5A3),
                ),
              ),
              child: TextButton.icon(
                icon: const Icon(
                  Icons.leaderboard,
                  size: 40,
                ),
                label: const Text(
                  'Sıralama',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  // NavigationService.instance.navigateToPage(
                  //     path: NavigationConstants.rankingPage);
                },
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFE5E5E5),
                border: Border.all(
                  color: const Color(0xFFA5A5A3),
                ),
              ),
              child: TextButton.icon(
                icon: const Icon(
                  Icons.menu_book,
                  size: 40,
                ),
                label: const Text(
                  'Blog',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  // NavigationService.instance
                  //     .navigateToPage(path: NavigationConstants.blogPage);
                },
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFE5E5E5),
                border: Border.all(
                  color: const Color(0xFFA5A5A3),
                ),
              ),
              child: TextButton.icon(
                icon: const Icon(
                  Icons.person,
                  size: 40,
                ),
                label: const Text(
                  'profil',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  // NavigationService.instance.navigateToPage(
                  //     path: NavigationConstants.profilePage);
                },
              ),
            ),
          ],
        ));
  }
}
