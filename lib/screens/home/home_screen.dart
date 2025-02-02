import 'package:flutter/material.dart';
import 'package:news/Widgets/app_drawer.dart';
import 'package:news/screens/home/categories_screen.dart';
import 'package:news/screens/home/news_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = " HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory ?? "Home",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: AppDrawer(
          getBackHome: getBackHome,
        ),
      ),
      body: selectedCategory == null
          ? CategoriesScreen(
              onClickedCategory: onClickCategory,
            )
          : NewsScreen(
              categoryName: selectedCategory!,
            ),
    );
  }

  String? selectedCategory;

  onClickCategory(category) {
    selectedCategory = category;
    setState(() {});
  }

  getBackHome() {
    selectedCategory = null;
    setState(() {});
  }
}
