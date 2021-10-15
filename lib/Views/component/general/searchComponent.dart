import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SearchComponent extends StatelessWidget {
  final String hintText;
  SearchComponent({this.hintText=""});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Container(
        child: TextFormField(
          style: Theme.of(context).textTheme.headline3,
          maxLines: 1,
          autofocus: false,
          decoration: InputDecoration(
              hintText: this.hintText,
              hintStyle: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary),
              contentPadding: scale.getPadding(1.1,1),
              border: InputBorder.none,
              prefixIcon:Image.asset(StringConfig.imgLocal+"search.png",color: Color(0xFFD4D4D4),)
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
