import 'package:flutter_consciousness/src/ui/screens/dashboard/dashboard.dart';
import 'package:flutter_consciousness/src/ui/screens/my_journey/my_journey_home.dart';
import 'package:flutter_consciousness/src/ui/screens/profile.dart';
import 'package:flutter_consciousness/src/ui/screens/shared_journey/shared_journey_home.dart';
import 'package:flutter_consciousness/src/ui/widgets/util_widgets.dart';
import 'package:flutter_consciousness/src/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Dashboard(),
    MyJourneyHome(),
    SharedJourneyHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        selectedFontSize: 16.0,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/home_outline.png"),
              size: 24.0,
            ),
            title: Text(
              'Home',
            ),
          ),
          new BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/tag_outline.png"),
                size: 24.0,
              ),
              title: Text(
                'My Deals',
              )),
          new BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 24.0,
              ),
              title: Text(
                'More',
              )),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    UtilWidgets.showToast(Constants.FEATURE_NOT_AVAILABLE,
//        context: context, gravity: 0, duration: 1);
    return Center(child: Text("Development in progress."));
  }
}
