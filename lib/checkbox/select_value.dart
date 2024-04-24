import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectValue extends StatefulWidget {
  const SelectValue({Key? key, required this.initialSelectedCategories})
      : super(key: key);
  final List<String> initialSelectedCategories;

  @override
  State<SelectValue> createState() => _SelectValueState();
}

class _SelectValueState extends State<SelectValue> {
  List<Map<String, dynamic>> categories = [
    {'icon': Icons.music_note, 'name': 'Müzik'}, // Music
    {'icon': Icons.sports, 'name': 'Spor'}, // Sports
    {'icon': Icons.palette, 'name': 'Hobiler & Tutkular'}, // Hobbies & Passions
    {'icon': Icons.videogame_asset, 'name': 'Oyun'}, // Game
    {
      'icon': Icons.airplanemode_active,
      'name': 'Seyahat & Tatil'
    }, // Travel & Vacation
    {'icon': Icons.work, 'name': 'Workshop'}, // Workshop
    {'icon': Icons.computer, 'name': 'Teknoloji'}, // Technology
    {
      'icon': Icons.business_center,
      'name': 'Kariyer & İş'
    }, // Career & Business
    {'icon': Icons.fastfood, 'name': 'Yeme & İçme'}, // Eat & Drink
    {'icon': Icons.movie, 'name': 'Film & Tiyatro'}, // Movie & Theater
    {'icon': Icons.brush, 'name': 'Sanat'}, // Art
    {'icon': Icons.shopping_cart, 'name': 'Alışveriş'}, // Shopping
    {'icon': Icons.event, 'name': 'Festival'}, // Festival
  ];

  late List<String> selectedCategories;

  @override
   void initState() {
    super.initState();
    selectedCategories = List.from(widget.initialSelectedCategories);
  }

  Future<void> _saveSelectedCategories() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedCategories', selectedCategories);
  }

  @override
  void dispose() {
    _saveSelectedCategories(); // Seçilen kategorileri kaydet
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Seç'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, selectedCategories);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final bool isSelected = selectedCategories.contains(category['name']);
          return CheckboxListTile(
            secondary: Icon(category['icon']),
            title: Text(category['name']),
            value: isSelected,
            activeColor: const Color(0xFF6536F3),
            onChanged: (bool? newValue) {
              setState(() {
                if (newValue == true) {
                  // If the checkbox is checked, add the category to the selected categories
                  selectedCategories.add(category['name']);
                } else {
                  // If the checkbox is unchecked, remove it from the selected categories
                  selectedCategories.remove(category['name']);
                }
              });
            },
          );
        },
      ),
    );
  }
}
