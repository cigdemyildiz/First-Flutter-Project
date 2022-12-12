import 'package:flutter/material.dart';
import '../view/login/service/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier{
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false ;
  bool get darkTheme=>_darkTheme;

  set darkTheme (bool value){
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}