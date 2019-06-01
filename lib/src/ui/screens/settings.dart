import 'package:flutter_consciousness/src/ui/screens/auth/auth_home.dart';
import 'package:flutter_consciousness/src/utils/object_factory.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "Settings",
          style: Theme.of(context).textTheme.title,
        ),
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              title: Text(
                "About",
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),
            Divider(),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              title: Text(
                "Feedback",
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),
            Divider(),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              title: Text(
                "Privacy policy",
                style: Theme.of(context).textTheme.subtitle,
              ),
            ),
            Divider(),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.subtitle,
              ),
              onTap: () => _logoutAction(),
            ),
          ],
        ),
      )),
    );
  }

  _logoutAction() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            content: Text("Do you really want to logout?"),
            actions: <Widget>[
              FlatButton(
                  child: Text(
                    "Cancel",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text(
                    "Logout",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () async {
                    ObjectFactory().prefs.clearPrefs();
                    ObjectFactory().prefs.setIsLoggedIn(false);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => AuthHome()),
                        (Route<dynamic> route) => false);
                  }),
            ],
          );
        });
  }
}
