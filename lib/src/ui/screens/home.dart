import 'package:flutter_consciousness/src/ui/screens/dashboard/dashboard.dart';
import 'package:flutter_consciousness/src/ui/screens/my_journey/my_collection_home.dart';
import 'package:flutter_consciousness/src/ui/screens/profile.dart';
import 'package:flutter_consciousness/src/ui/screens/shared_journey/shared_journey_home.dart';
import 'package:flutter_consciousness/src/ui/widgets/util_widgets.dart';
import 'package:flutter_consciousness/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:community_material_icon/community_material_icon.dart';

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
    MyCollection(),
    Dashboard(),
    SharedWithMe(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                icon: Icon(
                  CommunityMaterialIcons.bookmark_minus_outline,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text('Saved',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Theme.of(context).primaryColor)),
                activeColor: Theme.of(context).accentColor,
              ),
              BottomNavyBarItem(
                icon: Icon(
                  CommunityMaterialIcons.home_outline,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text('Home',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Theme.of(context).primaryColor)),
                activeColor: Theme.of(context).accentColor,
              ),
              BottomNavyBarItem(
                icon: Icon(
                  CommunityMaterialIcons.folder_account_outline,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text('Shared',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Theme.of(context).primaryColor)),
                activeColor: Theme.of(context).accentColor,
              ),
            ],
          )),
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
