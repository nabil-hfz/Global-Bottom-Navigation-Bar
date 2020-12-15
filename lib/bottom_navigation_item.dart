import 'package:flutter/material.dart';

class BottomNavigationItem {
  ///   The main navigation icon view.
  final BottomNavigationBarItem item;

  ///   Controller object to specify the duration of the animation and register the TickerProvider for the root widget.
  final AnimationController controller;

  ///   Animation Object to design and the animation as you wish.
  Animation<double> _animation;

  BottomNavigationItem({
    Color color,
    String title,
    Duration duration,
    @required Widget activeIcon,
    @required Widget inActiveIcon,
    @required TickerProvider vSync,
  })  : assert(inActiveIcon != null),
        assert(activeIcon != null),
        controller = AnimationController(
          vsync: vSync,
          duration: (duration != null && !duration.isNegative)
              ? duration
              : kThemeAnimationDuration,
          reverseDuration: duration,
        ),
        item = BottomNavigationBarItem(
          icon: inActiveIcon,
          activeIcon: activeIcon,
          label: title != null && title.isNotEmpty ? title : '',
          backgroundColor: color ?? Colors.white70,
        ) {
    _animation = controller.drive(
      CurveTween(
        curve: const Interval(0.1, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
  }
}
