import 'package:flutter_consciousness/src/ui/screens/settings.dart';
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
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              iconTheme: IconThemeData(color: Colors.black54),
              expandedHeight: 150.0,
              elevation: 0.5,
              floating: false,
              pinned: true,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Settings()));
                    }),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                background: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      "Flutter Consciousness",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    title: Text(
                      "ashdk",
                      style: Theme.of(context).textTheme.subtitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text("asjhdg"),
//                        trailing: index == 0
//                            ? Chip(
//                                label: Text("Owner"),
//                              )
//                            : null,
                    onTap: () {},
                  ),
                ],
              );
            }),
      )),
    );
  }
}
