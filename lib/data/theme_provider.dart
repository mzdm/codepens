import 'package:flutter/material.dart';

class ThemeStateContainer extends StatefulWidget {
  final Widget child;

  ThemeStateContainer({this.child});

  static ThemeStateContainerState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<_InheritedThemeStateContainer>()).data;

  @override
  ThemeStateContainerState createState() => ThemeStateContainerState();
}

class ThemeStateContainerState extends State<ThemeStateContainer> {
  bool isDarkMode = true;

  void update(bool newState) {
    if (isDarkMode == null) {
      isDarkMode = newState;
      setState(() => isDarkMode = isDarkMode);
    } else {
      setState(() => isDarkMode = newState ?? isDarkMode);
    }
  }

  @override
  Widget build(BuildContext context) => _InheritedThemeStateContainer(
        data: this,
        child: widget.child,
      );
}

class _InheritedThemeStateContainer extends InheritedWidget {
  final ThemeStateContainerState data;

  _InheritedThemeStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedThemeStateContainer old) =>
      data.isDarkMode != old.data.isDarkMode;
}
