import 'package:flutter/material.dart';

class SharedWithMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedWithMeState();
  }
}

class _SharedWithMeState extends State<SharedWithMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("Development in progress."))),
    );
  }
}
