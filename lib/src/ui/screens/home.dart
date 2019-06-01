import 'package:flutter_consciousness/src/ui/screens/dashboard/dashboard.dart';
import 'package:flutter_consciousness/src/ui/screens/my_journey/my_journey_home.dart';
import 'package:flutter_consciousness/src/ui/screens/profile.dart';
import 'package:flutter_consciousness/src/ui/screens/shared_journey/shared_journey_home.dart';
import 'package:flutter_consciousness/src/ui/widgets/util_widgets.dart';
import 'package:flutter_consciousness/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  int _currentIndex;
  final List<Widget> _children = [
    MyCollections(),
    ConsciousnessHome(),
    SharedWithMeHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _children[_selectedIndex],
      ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
//            _pageController.animateToPage(index,
//                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.purpleAccent
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
                activeColor: Colors.pink
            ),

          ],
        )
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
