import 'package:flutter/material.dart';

ThemeData lightThemeDefault = originalThemeL;

ThemeData darkThemeDefault = originalThemeD;

ThemeData originalThemeL =
    ThemeData.light().copyWith(backgroundColor: Colors.white);
ThemeData originalThemeD =
    ThemeData.dark().copyWith(backgroundColor: Colors.black12);

// CustomTheme currentTheme = CustomTheme();
//
// class CustomTheme with ChangeNotifier {
//   static bool _isDarkTheme = true;
//   ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
//
//   void toggleTheme() {
//     _isDarkTheme = !_isDarkTheme;
//     notifyListeners();
//   }
// }
