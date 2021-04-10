import 'package:flutter/material.dart';

import '../elevated_button.dart';
import '../sub/sub_fourth_screen.dart';

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButtonWidget(
            title: 'Fourth Screen',
            color: Colors.amber.shade600,
            subScreen: SubFourthScreen(),
          ),
        ],
      ),
    );
  }
}
