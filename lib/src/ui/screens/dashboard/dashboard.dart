import 'package:flutter_consciousness/src/ui/widgets/collection_card.dart';
import 'package:flutter_consciousness/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class MyCollections extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCollectionsState();
  }
}

class _MyCollectionsState extends State<MyCollections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: 4,
              itemBuilder:
                  (BuildContext context, int index) {
                return GestureDetector(
                    child:CollectionCard()
                );
              })
      ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){},)
    ,);
  }
}

