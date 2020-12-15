import 'package:flutter/material.dart';

class SubThirdScreen extends StatelessWidget {
  static const String routeName = "/SubThirdScreen";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sub Third Screen",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent),
          ),
        ],
      ),
    );
  }
}
