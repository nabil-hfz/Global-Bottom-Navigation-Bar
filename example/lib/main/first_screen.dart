import 'package:flutter/material.dart';

import '../sub/sub_first_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return


      Scaffold(appBar : AppBar(), body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => SubFirstScreen()));
              },
              child: Text(
                "First Screen",
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          ],
        ),
      ),);
  }
}
