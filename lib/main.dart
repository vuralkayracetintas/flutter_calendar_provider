import 'package:demo_apps/bloc/image_picker_bloc.dart';
import 'package:demo_apps/circle_examle.dart';
import 'package:demo_apps/cosmos/cosmos_package_ex.dart';

import 'package:demo_apps/provider/event_provider.dart';
import 'package:demo_apps/scroll_text_field.dart';
import 'package:demo_apps/textfield/textfield_view.dart';
import 'package:demo_apps/textformfield/textformfield_control.dart';
import 'package:demo_apps/utils/image_picker_utils.dart';
import 'package:demo_apps/vpn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()))
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          title: 'My App',
          home:  MyHomePage(),

          // home: KeyGuard(),
        ));

    // return MaterialApp.router(
    //   routerConfig: router,
    // );
  }
}

// final GoRouter router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const CharView();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'details',
//           builder: (BuildContext context, GoRouterState state) {
//             return DetailsScreen();
//           },
//         ),
//         GoRoute(
//           path: 'myWidget',
//           builder: (BuildContext context, GoRouterState state) {
//             return MyWidget();
//           },
//         ),
//       ],
//     ),
//   ],
// );

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 1);
    selectedPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _myPage,
          children: <Widget>[
            const Center(
              child: Text("Another Page"),
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Page 1"),
                ElevatedButton(
                  onPressed: () {
                    _myPage.jumpToPage(0);
                    setState(() {
                      selectedPage = 0;
                    });
                  },
                  child: const Text("Go to another page"),
                )
              ],
            )),
            const Center(child: Text("Page 2")),
            const Center(child: Text("Page 3")),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                color: selectedPage == 1 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(1);
                  setState(() {
                    selectedPage = 1;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.star),
                color: selectedPage == 2 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(2);
                  setState(() {
                    selectedPage = 2;
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                ),
                color: selectedPage == 3 ? Colors.blue : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(3);
                  setState(() {
                    selectedPage = 3;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
