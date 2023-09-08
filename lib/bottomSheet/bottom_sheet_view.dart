import 'package:demo_apps/bottomSheet/bottom_sheet_mixin.dart';
import 'package:flutter/material.dart';

class BottomSheetView extends StatefulWidget {
  const BottomSheetView({super.key});

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView>
    with BottomSheetMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: showBottomSheetFunction,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder<String>(
              valueListenable: titleNotifier,
              builder: (context, value, child) {
                return Text(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
