import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CollectionCard extends StatefulWidget {
  @override
  _CollectionCardState createState() => _CollectionCardState();
}

class _CollectionCardState extends State<CollectionCard> {
  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
    child:Container(
      height: 200,
    )));
  }
}
