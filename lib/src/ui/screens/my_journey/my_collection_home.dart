import 'package:flutter/material.dart';
import 'package:flutter_consciousness/src/models/collection.dart';
import 'package:flutter_consciousness/src/resources/repository/repository.dart';
import 'package:flutter_consciousness/src/ui/screens/my_journey/bookmarks.dart';
import 'package:flutter_consciousness/src/ui/screens/my_journey/collection_card_item.dart';
import 'package:flutter_consciousness/src/utils/object_factory.dart';

class MyCollection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCollectionState();
  }
}

class _MyCollectionState extends State<MyCollection> {
  Repository repository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repository = new Repository();
  }

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
                  padding: EdgeInsets.all(22.0),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: CollectionCardItem(),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Bookmarks()));
                      },
                    );
                  })),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showSubmitBidDialogue();
          }),
    );
  }

  void showSubmitBidDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: 500.0,
            child: SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              title: Text(
                "Add Collections",
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context)
                                .indicatorColor
                                .withOpacity(.25),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Collection Title",
                            labelStyle: Theme.of(context).textTheme.subhead),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * .15,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context)
                                  .indicatorColor
                                  .withOpacity(.25),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Collection Details",
                              labelStyle: Theme.of(context).textTheme.subhead),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      )),
                ),
                ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () async {
                          String user = ObjectFactory().prefs.getUsername();
                          repository.dataProvider.addCollection(new Collection(
                              collectionName: 'new Collection',
                              description: 'description',
                              collaborators: new List<String>(),
                              createdBy: user,
                              createdOn: DateTime.now()));
                          Navigator.pop(context);
                        },
                      ),
                    ]),
              ],
            ),
          );
        });
  }
}
