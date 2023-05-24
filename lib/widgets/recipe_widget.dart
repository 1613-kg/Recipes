import 'package:flutter/material.dart';
import 'package:recipes/models/recipe_model.dart';

import '../screens/WebView.dart';

class RecipeWidget extends StatefulWidget {
  List<RecipeModel> recipeList = <RecipeModel>[];
  RecipeWidget(this.recipeList);

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.recipeList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (WebView(
                              widget.recipeList[index].label,
                              widget.recipeList[index].appUrl))));
                });
              },
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0.0,
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.recipeList[index].imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(color: Colors.black26),
                      child: Text(
                        widget.recipeList[index].label,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    height: 40,
                    width: 80,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                size: 15,
                              ),
                              Text(widget.recipeList[index].cal
                                  .toString()
                                  .substring(0, 6)),
                            ],
                          ),
                        )),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
