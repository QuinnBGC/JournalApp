import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/db_manager.dart';
import 'app.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();

await DatabaseManager.initalize();
runApp(
  MyApp(preferences: await SharedPreferences.getInstance()));
}