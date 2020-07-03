import 'package:flutter/material.dart';

AppBar detailsAppBar() {
  return AppBar(
    elevation: 0,
    /*leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {},
    ),*/
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.share),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.more),
        onPressed: () {},
      ),
    ],
  );
}
