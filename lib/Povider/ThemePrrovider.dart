import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  var _themeMode=ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode( themeMode){
    _themeMode=themeMode;
    notifyListeners();
  }

  void toggleThemeMode(){
    _themeMode= _themeMode==ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

  }

}