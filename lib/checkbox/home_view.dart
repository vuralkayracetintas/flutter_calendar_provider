import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo_apps/checkbox/select_value.dart'; // Seçim yapılan sayfanın import edilmesi gerekiyor

class HomeViewCheck extends StatefulWidget {
  const HomeViewCheck({Key? key}) : super(key: key);

  @override
  _HomeViewCheckState createState() => _HomeViewCheckState();
}

class _HomeViewCheckState extends State<HomeViewCheck> {
  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    _loadSelectedCategories(); // Seçilen kategorileri yükle
  }

  Future<void> _loadSelectedCategories() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCategories = prefs.getStringList('selectedCategories') ?? [];
    });
  }

  Future<void> _selectInterest() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectValue(initialSelectedCategories: selectedCategories)),
    );

    // Gelen veriyi işle
    if (result != null) {
      setState(() {
        selectedCategories = List.from(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ListTile(
              onTap: () async {
                await _selectInterest(); // Handle interest selection
              },
              leading: const Icon(Icons.star),
              title: Text(selectedCategories.isNotEmpty
                  ? selectedCategories.join(', ')
                  : 'Select Categories'),
            )
          ],
        ),
      ),
    );
  }
}
