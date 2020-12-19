import 'package:flutter/material.dart';
import 'package:global_bottom_navigation_bar/tab_item.dart';
import 'bottom_navigation_item.dart';

class GlobalBottomNavigationBar extends StatefulWidget {
  const GlobalBottomNavigationBar({
    this.currentTab,
    this.navigationViews = const [],
    this.type = BottomNavigationBarType.shifting,
    this.onSelectTab,
    this.tickerProvider,
  });

  final List<BottomNavigationItem> navigationViews;

  /// Enum variable to specify the current tab we are on.
  final BottomNavigationTabNumber currentTab;

  /// For Tab animation by Default it is shifting value.
  final BottomNavigationBarType type;

  /// Tickers is used to notify whenever a frame triggers.
  final TickerProvider tickerProvider;

  /// A helper method to make a callback when the use click on any tab.
  final ValueChanged<BottomNavigationTabNumber> onSelectTab;

  @override
  _GlobalBottomNavigationBarState createState() =>
      _GlobalBottomNavigationBarState();
}

class _GlobalBottomNavigationBarState extends State<GlobalBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (BottomNavigationItem view in widget.navigationViews)
      view.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.navigationViews.length);
    if (widget.currentTab.index != _currentIndex)
      _currentIndex = widget.currentTab.index;
    return BottomNavigationBar(
        type: widget.type,
        currentIndex: _currentIndex,
        items: widget.navigationViews
            .map<BottomNavigationBarItem>(
                (BottomNavigationItem navigationView) => navigationView.item)
            .toList(),
        showUnselectedLabels: false,
        onTap: (index) {
          changeIndex(index);
          widget.onSelectTab(
            BottomNavigationTabNumber.values[index],
          );
        });
  }

  changeIndex(int index) {
    widget.navigationViews[_currentIndex].controller.reverse();
    _currentIndex = index;
    widget.navigationViews[_currentIndex].controller.forward();
  }
}
