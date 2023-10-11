import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  final bool isIconButtonSelected = false;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TextFormField Kontrolü'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: textController,
                decoration: InputDecoration(labelText: 'Metin Alanı'),
              ),
              SizedBox(height: 20),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (textController.text.trim().isNotEmpty &&
                      isIconButtonSelected) {
                    // Metin alanı dolu ve IconButton seçildiyse tıklamaya izin ver
                    // İşlemlerinizi burada gerçekleştirebilirsiniz.
                  } else {
                    // Tıklamayı engelle
                    print('Metin alanı boş veya IconButton seçilmedi.');
                  }
                },
              ),
              ElevatedButton(
                child: Text('Gönder'),
                onPressed: () {
                  if (textController.text.trim().isNotEmpty) {
                    print('veri var');
                  } else {
                    _showMyDialog();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
