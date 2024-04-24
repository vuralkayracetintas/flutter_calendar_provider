import 'package:flutter/material.dart';

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({super.key});

  @override
  State<TextFormFieldDemo> createState() => _TextFormFieldDemoState();
}

class _TextFormFieldDemoState extends State<TextFormFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(validator: (value) {
                if (value!.isEmpty) {
                  return 'enter data';
                }
                return null;
              }),
              ElevatedButton(
                onPressed: () {},
                child: Text("Gönder"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6536F3),
                  foregroundColor: Colors.white,
                  // backgroundColor: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  side: const BorderSide(
                    color: const Color(0xFF6536F3),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Gönder"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF6536F3),
                  backgroundColor: Colors.white,
                  // backgroundColor: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  side: const BorderSide(
                    color: const Color(0xFF6536F3),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
