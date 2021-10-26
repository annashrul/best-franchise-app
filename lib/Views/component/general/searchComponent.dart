import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SearchComponent extends StatelessWidget {
  final String hintText;
  final void Function(String e) callback;
  SearchComponent({this.hintText="",this.callback});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Container(
        padding: scale.getPadding(0,2),
        child: TextFormField(
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
          autofocus: false,
          decoration: InputDecoration(
            hintText: this.hintText,
            hintStyle: Theme.of(context).textTheme.headline2,
            contentPadding: scale.getPadding(1,2),
            border: InputBorder.none,
            prefixIcon:Icon(FontAwesome.search,size: scale.getTextSize(12),),
            prefixIconConstraints: BoxConstraints(
              minHeight: scale.getHeight(1),
              minWidth: scale.getWidth(5),
              maxWidth: scale.getWidth(5),
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: this.callback,
        ),
      ),
    );
  }
}
