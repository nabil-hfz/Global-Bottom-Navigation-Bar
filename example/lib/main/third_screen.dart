import 'package:flutter/material.dart';

import '../sub/sub_third_screen.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => SubThirdScreen()));
            },
            child: Text(
              "Third Screen",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
