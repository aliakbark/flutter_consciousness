import 'package:flutter/material.dart';

class BookmarkItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookmarkItemState();
  }
}

class _BookmarkItemState extends State<BookmarkItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("19 June 2019"),
            ),
          ],
        ),
      ),
    );
  }
}
