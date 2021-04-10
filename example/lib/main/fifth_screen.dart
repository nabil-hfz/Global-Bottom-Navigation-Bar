import 'package:flutter/material.dart';

import '../elevated_button.dart';
import '../sub/sub_fifth_screen.dart';

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButtonWidget(
            title: 'Fifth Screen',
            color: Colors.deepOrangeAccent,
            subScreen: SubFifthScreen(),
          ),
        ],
      ),
    );
  }
}
