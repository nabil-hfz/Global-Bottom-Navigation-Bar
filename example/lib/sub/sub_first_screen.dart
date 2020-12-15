import 'package:flutter/material.dart';

class SubFirstScreen extends StatelessWidget {
  static const String routeName = "/SubFirstScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sub First Screen",
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
