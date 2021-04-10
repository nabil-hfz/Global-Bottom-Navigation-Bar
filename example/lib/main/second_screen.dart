import 'package:flutter/material.dart';

import '../elevated_button.dart';
import '../sub/sub_second_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButtonWidget(
            title: 'Second Screen',
            color: Colors.green,
            subScreen: SubSecondScreen(),
          ),
        ],
      ),
    );
  }
}
