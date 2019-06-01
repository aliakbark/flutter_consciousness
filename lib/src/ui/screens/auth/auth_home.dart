import 'package:flutter_consciousness/src/ui/screens/auth/login.dart';
import 'package:flutter_consciousness/src/utils/object_factory.dart';
import 'package:flutter/material.dart';

class AuthHome extends StatelessWidget {
  AuthHome() {
    ObjectFactory().prefs.clearPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: new Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/auth_home_bg1.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            new Container(
              decoration: BoxDecoration(color: Colors.black12.withOpacity(0.4)),
            ),
            new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: new Center(
                      child: new FlutterLogo(
                    size: 96.0,
                  )),
                ),
                new Expanded(
                    child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 16.0),
                        child: new Text(
                          "Short description of Drive will be displayed here...",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      new RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Login()));
                        },
//                        color: Theme.of(context).buttonColor,
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text("Get started"),
                      ),
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
