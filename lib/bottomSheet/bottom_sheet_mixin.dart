import 'package:demo_apps/bottomSheet/bottom_sheet_view.dart';
import 'package:demo_apps/bottomSheet/text_bottom_sheet.dart';
import 'package:flutter/material.dart';

mixin BottomSheetMixin on State<BottomSheetView> {
  final String _title = '';
  final TextEditingController _controller = TextEditingController();

  String get title => _title;
  TextEditingController get controller => _controller;

  ValueNotifier<String> titleNotifier = ValueNotifier<String>(''); // setstate

  Future<void> showBottomSheetFunction() async {
    final response = await TextBottomSheet.show(context);
    if (response == null) return;
    titleNotifier.value = response;
  }
}
