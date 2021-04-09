import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:global_bottom_navigation_bar/tab_item.dart';

import 'bottom_navigation_bar.dart';
import 'bottom_navigation_item.dart';

class ScaffoldGlobalBottomNavigation extends StatefulWidget {
  final bool extendBody;

  /// The primary content of the scaffold.
  final List<Widget> listOfChild;

  /// The primary content of the scaffold.
  final List<BottomNavigationItem> listOfBottomNavigationItem;

  /// If true, and an [appBar] is specified, then the height of the [body] is
  final bool extendBodyBehindAppBar;

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget appBar;

  /// A button displayed floating above [body], in the bottom right corner.
  final Widget floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  final FloatingActionButtonLocation floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  final FloatingActionButtonAnimator floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  final List<Widget> persistentFooterButtons;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
  /// right-to-left ([TextDirection.rtl])
  final Widget drawer;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from right-to-left ([TextDirection.ltr]) or
  /// left-to-right ([TextDirection.rtl])
  final Widget endDrawer;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  final Color drawerScrimColor;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  final Color backgroundColor;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  final Widget bottomNavigationBar;

  /// The persistent bottom sheet to display.
  final Widget bottomSheet;

  final bool resizeToAvoidBottomInset;

  /// Whether this scaffold is being displayed at the top of the screen.
  final bool primary;

  /// {@macro flutter.material.drawer.dragStartBehavior}
  final DragStartBehavior drawerDragStartBehavior;

  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  final double drawerEdgeDragWidth;

  /// Determines if the [Scaffold.drawer] can be opened with a drag
  /// gesture.
  final bool drawerEnableOpenDragGesture;

  /// Determines if the [Scaffold.endDrawer] can be opened with a
  /// drag gesture.
  final bool endDrawerEnableOpenDragGesture;

  const ScaffoldGlobalBottomNavigation({
    Key key,
    this.appBar,
    @required this.listOfChild,
    @required this.listOfBottomNavigationItem,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
  })  : assert(
            listOfChild != null &&
                (listOfChild.length > 1 || listOfChild.length <= 6),
            'You should provide a valid list. This list must not be null and '
            'also number of widgets have to be '
            'between 2 and 6 widgets at max'),
        assert(
            listOfBottomNavigationItem != null &&
                (listOfBottomNavigationItem.length > 1 ||
                    listOfBottomNavigationItem.length <= 6),
            'You should provide a valid list. This list must not be null and '
            'also number of Widgets have to be '
            'between 2 and 6 bottom navigation item at max'),
        assert(
            listOfChild.length == listOfBottomNavigationItem.length,
            'The list of child widgets and the list of bottom navigation item '
            'must be equal in length '),
        super(key: key);

  @override
  _ScaffoldGlobalBottomNavigationState createState() =>
      _ScaffoldGlobalBottomNavigationState();
}

class _ScaffoldGlobalBottomNavigationState
    extends State<ScaffoldGlobalBottomNavigation>
    with TickerProviderStateMixin {
  DateTime currentBackPressTime;
  BottomNavigationTabNumber _currentTab = BottomNavigationTabNumber.FIRST_TAB;
  Map<BottomNavigationTabNumber, GlobalKey<NavigatorState>> navigatorKeys = {};
  List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    buildChildrenAndNavigatorKeysList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: IndexedStack(
          index: _currentTab.index,
          children: _list,
        ),
      ),
      bottomNavigationBar: GlobalBottomNavigationBar(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
        tickerProvider: this,
        navigationViews: widget.listOfBottomNavigationItem,
      ),
      drawer: widget.drawer,
      primary: widget.primary,
      endDrawer: widget.endDrawer,
      extendBody: widget.extendBody,
      backgroundColor: widget.backgroundColor,
      drawerScrimColor: widget.drawerScrimColor,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      floatingActionButton: widget.floatingActionButton,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      persistentFooterButtons: widget.persistentFooterButtons,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
      bottomSheet: widget.bottomSheet,
    );
  }

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await navigatorKeys[_currentTab].currentState.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (_currentTab != BottomNavigationTabNumber.FIRST_TAB) {
        _selectTab(BottomNavigationTabNumber.FIRST_TAB);
        return false;
      } else {
          return isFirstRouteInCurrentTab;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  void buildChildrenAndNavigatorKeysList() {
    int length = widget.listOfChild.length;
    for (int i = 0; i < length; ++i) {
      navigatorKeys.putIfAbsent(BottomNavigationTabNumber.values[i],
          () => GlobalKey<NavigatorState>());
      _list.add(_buildNavigator(
          BottomNavigationTabNumber.values[i], widget.listOfChild[i]));
    }
  }

  Widget _buildNavigator(BottomNavigationTabNumber tabItem, Widget child) {
    return Navigator(
      key: navigatorKeys[tabItem],
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }

  void _selectTab(BottomNavigationTabNumber tabItem) {
    navigatorKeys[_currentTab].currentState.popUntil((route) => route.isFirst);
    if (tabItem != _currentTab)
      setState(() {
        _currentTab = tabItem;
      });
  }
}
