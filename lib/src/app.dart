import 'package:flutter/material.dart';
import 'package:flutter_consciousness/src/ui/screens/auth/auth_home.dart';
import 'package:flutter_consciousness/src/ui/screens/home.dart';
import 'package:flutter_consciousness/src/utils/object_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  App(SharedPreferences sharedPreferences) {
    ObjectFactory().setPrefs(sharedPreferences);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFf4f6f0),
          primaryColor: Color(0xFF485550),
//          primarySwatch: Colors.green,
          accentColor: Colors.greenAccent,
          buttonColor: Color(0xFF485550),
          dialogTheme: DialogTheme(),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              textTheme: ButtonTextTheme.accent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0))),
          tabBarTheme: TabBarTheme(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: Theme.of(context).textTheme.subtitle,
            unselectedLabelStyle: Theme.of(context).textTheme.subtitle,
            labelColor: Theme.of(context).primaryColor,
          ),
          disabledColor: Colors.white70,
          iconTheme: IconThemeData(color: Colors.black45),
          fontFamily: "Noto Sans HK",
          textTheme: TextTheme(
            display3: TextStyle(
              fontSize: 56.0,
            ),
            display2: TextStyle(fontSize: 45.0),
            display1: TextStyle(fontSize: 34.0),
            headline: TextStyle(fontSize: 24.0),
            title: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1,
            ),
            subtitle: TextStyle(
              fontSize: 18.0,
              letterSpacing: 1,
            ),
            subhead: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            body2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
            body1: TextStyle(fontSize: 14.0, letterSpacing: 1),
            caption: TextStyle(fontSize: 12.0),
            button: TextStyle(
              fontSize: 16.0,
            ),
          )),
//      home: Home(),
      home: ObjectFactory().prefs.isLoggedIn() ? Home() : AuthHome(),
    );
  }
}
