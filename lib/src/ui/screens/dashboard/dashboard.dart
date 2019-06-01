import 'package:flutter_consciousness/src/ui/screens/settings.dart';
import 'package:flutter_consciousness/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

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
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return dashboardCard();
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: ListTile(
                              leading: Icon(
                                Icons.graphic_eq,
                                color: Colors.greenAccent,
                              ),
                              title: Text(
                                "Grow collaboratively!",
                                style: Theme.of(context).textTheme.headline,
                              ),
                              subtitle: Text(
                                "We all got to track our journey of learning. Let's build the world together!!",
                                style: Theme.of(context).textTheme.subhead,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }),
        ),
      )),
    );
  }

  Widget dashboardCard() {
    return Container(
      height: 192.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: CarouselSlider(
        autoPlay: true,
        pauseAutoPlayOnTouch: Duration(seconds: 3),
        reverse: false,
        viewportFraction: 1.0,
        scrollDirection: Axis.horizontal,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        aspectRatio: 16 / 9,
        onPageChanged: (index) {},
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: ListTile(
                          leading: Image(
                              image: AssetImage("assets/images/sprout.png")),
                          title: Text(
                            "Grow collaboratively!",
                            style: Theme.of(context).textTheme.headline,
                          ),
                          subtitle: Text(
                            "We all got to track our journey of learning. Let's build the world together!",
                            style: Theme.of(context).textTheme.subhead,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
