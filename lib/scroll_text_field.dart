import 'package:flutter/material.dart';

class ScrollTextField extends StatefulWidget {
  const ScrollTextField({Key? key}) : super(key: key);

  @override
  State<ScrollTextField> createState() => _ScrollTextFieldState();
}

class _ScrollTextFieldState extends State<ScrollTextField> {
  /// Page Scroll Controller
  ScrollController scrollController = ScrollController();

  /// isFab [bool] value
  bool isFab = false;

  /// Initialize [scroll Controller]
  /// scrollController.offset > 0
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > 50) {
        setState(() {
          isFab = true;
        });
      } else {
        setState(() {
          isFab = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: isFab
          ? FloatingActionButton(
              child: const Icon(Icons.file_copy),
              onPressed: () {},
            )
          : FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text('Floating Action Button Scroll Control')),
      body: Center(
        child: ListView.builder(
          controller: scrollController,
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Index : $index'),
            );
          },
        ),
      ),
    );
  }
}
