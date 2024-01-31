import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NonSliverGridExample extends StatefulWidget {
  @override
  _NonSliverGridExampleState createState() => _NonSliverGridExampleState();
}

class _NonSliverGridExampleState extends State<NonSliverGridExample> {
  int? _currentIndex;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: context.sized.width,
            height: context.sized.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.alarm),
                    Text('Etkinlik Slotlari'),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                            print(index + 10);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index ? Colors.red : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 10}:00 ${index + 10 > 17 ? "PM" : ""}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
