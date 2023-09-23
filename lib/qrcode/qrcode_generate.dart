import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeCreatePage extends StatefulWidget {
  const QrCodeCreatePage({super.key});

  @override
  State<QrCodeCreatePage> createState() => _QrCodeCreatePageState();
}

class _QrCodeCreatePageState extends State<QrCodeCreatePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create QR Code'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            QrImageView(
              data: controller.text,
            ),
            const SizedBox(height: 20),
            buildTextField(context)
          ]),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the data',
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0XFF5fa693)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          suffixIcon: IconButton(
            color: const Color(0XFF5fa693),
            icon: const Icon(
              Icons.done,
              size: 30,
            ),
            onPressed: () => setState(() {}),
          ),
        ),
      ));
}
