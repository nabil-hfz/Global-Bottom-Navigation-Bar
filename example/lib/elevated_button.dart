import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    this.subScreen,
    this.title,
    this.color,
  });

  final Widget subScreen;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => this.subScreen),
        );
      },
      child: Text(
        this.title,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: this.color,
        ),
      ),
    );
  }
}
