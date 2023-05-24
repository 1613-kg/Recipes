import 'package:flutter/material.dart';
import 'package:recipes/screens/WebView.dart';
import 'package:recipes/screens/home_screen.dart';

import 'screens/loading_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Recipe",
      home: LoadingScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        //WebView.routeName: (ctx) => WebView(),
      },
    );
  }
}
