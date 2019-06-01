import 'package:flutter_consciousness/src/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(new App(sharedPreferences));
}
