import 'package:flutter/material.dart';

import '../widgets/recipe_widget.dart';
import '../models/recipe_model.dart';
import '../widgets/greetings.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    List<RecipeModel> recipeList = data['recipeList'] as List<RecipeModel>;
    String label = "";
    String name = data['name'];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 170, 216, 214),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBox(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Greetings(name),
                    RecipeWidget(recipeList),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
