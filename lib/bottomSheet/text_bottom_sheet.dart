// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TextBottomSheet extends StatelessWidget {
  TextBottomSheet({
    Key? key,
  }) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  static Future<String?> show(context) {
    return showModalBottomSheet<String>(
      context: context,
      isDismissible: true,
      builder: (context) {
        return TextBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.medium,
      child: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _controller.text);
              _controller.clear();
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
