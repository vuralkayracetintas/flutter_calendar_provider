import 'package:flutter/material.dart';

class TextFieldView extends StatefulWidget {
  const TextFieldView({super.key});

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  TextEditingController controller = TextEditingController();
  bool isActive = false;
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      final isActive = controller.text.isNotEmpty;
      setState(() {
        this.isActive = isActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: isActive
                  ? () {
                      setState(() {
                        isActive = true;
                      });
                    }
                  : null,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
