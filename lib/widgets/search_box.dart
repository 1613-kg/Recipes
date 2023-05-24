import 'package:flutter/material.dart';

import 'package:recipes/models/recipe_model.dart';
import 'package:recipes/providers/recipes_data.dart';
import 'package:recipes/screens/home_screen.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _textEditingController = new TextEditingController();
  List<RecipeModel> recipeList = <RecipeModel>[];

  void getDataP(String query) async {
    Providers data = Providers(query, recipeList);
    await data.getData();

    recipeList = data.recipeList;

    Navigator.pushReplacementNamed(context, HomeScreen.routeName, arguments: {
      "recipeList": recipeList,
      "name": query,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black12),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onTap: () {
              setState(() {
                String text = _textEditingController.text;
                getDataP(text);
              });
            },
          ),
          Padding(padding: EdgeInsets.all(5)),
          Expanded(
              child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "Search your dish"),
          ))
        ],
      ),
    );
  }
}
