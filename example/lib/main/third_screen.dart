import 'package:flutter/material.dart';

import '../elevated_button.dart';
import '../sub/sub_third_screen.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButtonWidget(
            title: 'Third Screen',
            color: Colors.pink.shade600,
            subScreen: SubThirdScreen(),
          ),
        ],
      ),
    );
  }
}
