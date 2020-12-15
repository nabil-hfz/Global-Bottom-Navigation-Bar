import 'package:flutter/material.dart';

class SubFourthScreen extends StatelessWidget {
  static const String routeName = "/SubFourthScreen";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sub Fourth Screen",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
