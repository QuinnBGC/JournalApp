import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel {
  final key;
  bool state;
  SharedPreferences prefs;

  ThemeModel({@required this.state, @required this.prefs, @required this.key});

  void changeTheme(state) {
    prefs.setBool(key, state);
  }

  Brightness getTheme() =>
    key ? Brightness.dark : Brightness.light;

}


class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}

final darkTheme = ThemeData(
  primarySwatch: Colors.white,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.black,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white,
);