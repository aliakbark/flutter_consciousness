import 'package:flutter/material.dart';
import 'package:flutter_consciousness/src/ui/screens/my_journey/collection_card_item.dart';

class MyCollection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCollectionState();
  }
}

class _MyCollectionState extends State<MyCollection> {
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "My collection",
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
          body: Container(
              child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(child: CollectionCardItem());
                  })),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
