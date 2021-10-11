

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralHelper{
  static appBarWithImage({BuildContext context,String title="Kayla Andhara",String desc="Berita terupdate untukmu",bool isAction=false,void Function() callback}){
    return AppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: Theme.of(context).textTheme.headline1),
              isAction?InTouchWidget(
                  callback:callback,
                  child: Text(desc,style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.bluePrimary))
              ):Text(desc,style: Theme.of(context).textTheme.headline2),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(StringConfig.imgUser),
          )
        ],
      ),
    );
  }
}