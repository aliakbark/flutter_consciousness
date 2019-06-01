import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_consciousness/src/models/collection.dart';

class CollectionCardItem extends StatefulWidget {
  DocumentSnapshot document ;
  CollectionCardItem(this.document);

  @override
  _CollectionCardItemState createState() => _CollectionCardItemState();
}

class _CollectionCardItemState extends State<CollectionCardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColor,
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Row(
//                      children: <Widget>[
//                        ClipRRect(
//                          borderRadius: BorderRadius.all(Radius.circular(48)),
//                          child: Container(
//                            height: 40,
//                            width: 40,
//                            child: Icon(Icons.transform),
//                          color: Theme.of(context).scaffoldBackgroundColor,),
//                        ),
//                      ],
//                    ),
//                  ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Text(widget.document.data['collection_name'],style: TextStyle(fontSize: 25,color: Colors.white),)
                    ],
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Text(widget.document.data['description'],style: TextStyle(fontSize: 15,color: Colors.white),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        Text("",style: TextStyle(fontSize: 15,color: Colors.white),)
                      ],
                    ),
                  )



              ],),
            )));
  }
}
