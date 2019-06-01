import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CollectionCardItem extends StatefulWidget {
  @override
  _CollectionCardItemState createState() => _CollectionCardItemState();
}

class _CollectionCardItemState extends State<CollectionCardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: 200,
            )));
  }
}
