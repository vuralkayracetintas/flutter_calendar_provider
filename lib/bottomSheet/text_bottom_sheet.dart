// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TextBottomSheet extends StatefulWidget {
  TextBottomSheet({
    Key? key,
  }) : super(key: key);

  static Future<TextBottomModel?> show(context) {
    return showModalBottomSheet<TextBottomModel>(
      context: context,
      isDismissible: true,
      builder: (context) {
        return TextBottomSheet();
      },
    );
  }

  @override
  State<TextBottomSheet> createState() => _TextBottomSheetState();
}

class _TextBottomSheetState extends State<TextBottomSheet> with _TextMixin {
  static const _saveButton = 'Save';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.medium,
      child: Column(
        children: [
          TextField(
            onChanged: _updateTextField,
          ),
          Checkbox(
            value: _isCheck,
            onChanged: _updateChechBox,
          ),
          IgnorePointer(
            ignoring: !_isValid,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _isValid ? 1 : 0.5,
              child: ElevatedButton(
                onPressed: _saveButtonFunction,
                child: const Text(_saveButton),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class TextBottomModel {
  final String value;
  final bool isCheck;

  TextBottomModel({required this.value, required this.isCheck});
}

mixin _TextMixin on State<TextBottomSheet> {
  bool _isCheck = false;
  bool get _isValid => _isCheck && _textValue.isNotEmpty;
  String _textValue = '';
  void _updateChechBox(bool? value) {
    if (value == null) return;
    setState(() {
      _isCheck = value;
    });
  }

  void _updateTextField(String value) {
    setState(() {
      _textValue = value;
    });
  }

  void _saveButtonFunction() {
    if (!_isValid) return;
    Navigator.pop(
        context,
        TextBottomModel(
          value: _textValue,
          isCheck: _isCheck,
        ));
  }
}
