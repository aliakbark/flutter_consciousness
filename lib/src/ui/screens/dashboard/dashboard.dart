import 'package:flutter_consciousness/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardSate();
  }
}

class _DashboardSate extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
//                  ImageIcon(
//                    AssetImage(
//                      "assets/icons/home_outline.png",
//                    ),
//                    size: 24.0,
//                    color: Theme.of(context).primaryColor,
//                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Flutter consciousness",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              floating: true,
              snap: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.0,
              pinned: false,
              forceElevated: true,
              actions: <Widget>[],
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                Constants.sample_text3,
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
