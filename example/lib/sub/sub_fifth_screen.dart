import 'package:flutter/material.dart';

class SubFifthScreen extends StatelessWidget {
  static const String routeName = "/SubFifthScreen";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sub Fifth Screen",
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
