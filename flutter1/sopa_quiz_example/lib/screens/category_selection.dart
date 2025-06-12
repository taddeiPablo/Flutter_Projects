import 'package:flutter/material.dart';
import 'game_screen.dart'; // Asegurate de tener este import correcto

class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}

class CategoryScreen extends StatelessWidget {
  /*Category("Arte", Icons.palette),
    Category("Música", Icons.music_note),*/
  final List<Category> categories = [
    Category("Historia", Icons.history_edu),
    Category("Paises", Icons.public),
    Category("Deportes", Icons.sports_soccer),
    Category("Literatura", Icons.menu_book),
    Category("Geografía", Icons.map),
    Category("Ciencia", Icons.science),
  ];

  CategoryScreen({super.key});
  // category: categoryName
  void _startGameWithCategory(BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(category: categoryName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selecciona una Categoría")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dos columnas
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () => _startGameWithCategory(context, category.name),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(category.icon, size: 48, color: Colors.blueAccent),
                    SizedBox(height: 12),
                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
