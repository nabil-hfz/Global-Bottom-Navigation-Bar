import 'package:flutter/material.dart';

class SubSecondScreen extends StatelessWidget {
  static const String routeName = "/SubSecondScreen";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sub Second Screen",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
