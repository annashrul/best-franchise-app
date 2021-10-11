import 'package:flutter/material.dart';
class AppBarComponent extends AppBar with PreferredSizeWidget {
  @override
  get preferredSize => Size.fromHeight(50);

  AppBarComponent({Key key, Widget title}) : super(
    key: key,
    title: title,
    // maybe other AppBar properties
  );
}