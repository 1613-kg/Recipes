import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:recipes/models/recipe_model.dart';

class Providers {
  String query;
  List<RecipeModel> recipeList = <RecipeModel>[];
  Providers(this.query, this.recipeList);

  Future<void> getData() async {
    final url = Uri.parse(
        "https://api.edamam.com/search?q=$query&app_id=f7d194f8&app_key=73ebab813746c909d54ce0b4c5ab2437");
    final response = await http.get(url);

    var data = json.decode(response.body);

    data['hits'].forEach((element) {
      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromMap(element['recipe']);
      recipeList.add(recipeModel);
    });
  }
}
