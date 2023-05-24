import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Greetings extends StatefulWidget {
  //const Greetings({super.key});

  String name;
  Greetings(this.name);
  @override
  State<Greetings> createState() => _GreetingsState();
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

class _GreetingsState extends State<Greetings> {
  @override
  Widget build(BuildContext context) {
    String message = greeting();
    return Container(
      height: 80,
      padding: (EdgeInsets.all(15)),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.food_bank),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,$message",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withBlue(120),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Enjoy your ${widget.name} dishes!",
                style:
                    TextStyle(color: Colors.black.withBlue(60), fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
