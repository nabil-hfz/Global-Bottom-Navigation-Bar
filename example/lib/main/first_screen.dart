import 'package:flutter/material.dart';

import '../elevated_button.dart';
import '../sub/sub_first_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Bottom Navigation'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButtonWidget(
              title: 'First Screen',
              color: Colors.red,
              subScreen: SubFirstScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
