import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../models/recipe_model.dart';
import '../providers/recipes_data.dart';
import 'home_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipeList = <RecipeModel>[];

    void startApp(String query) async {
      Providers data = Providers(query, recipeList);
      await data.getData();

      recipeList = data.recipeList;

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName,
            arguments: {
              "recipeList": recipeList,
              "name": query,
            });
      });
    }

    startApp("Apple");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 170, 216, 214),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Recipes",
            style: TextStyle(fontSize: 40, color: Colors.black87),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Get recipes for your favourite food",
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 80,
            width: 80,
            child: LoadingIndicator(
              indicatorType: Indicator.lineScale,
              strokeWidth: 2,
              colors: [Colors.white],
            ),
          ),
        ]),
      ),
    );
  }
}
