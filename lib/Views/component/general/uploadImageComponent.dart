import 'dart:convert';

import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class UploadImageComponent extends StatefulWidget {
  final void Function(dynamic data) callback;
  UploadImageComponent({this.callback});
  @override
  _UploadImageComponentState createState() => _UploadImageComponentState();
}

class _UploadImageComponentState extends State<UploadImageComponent> {
  Future toImage(img)async{
    if(img!=null){
      String fileName;
      String base64Image;
      fileName = img["file"].path.split("/").last;
      var type = fileName.split('.');
      base64Image = 'data:image/' + type[1] + ';base64,' + base64Encode(img["file"].readAsBytesSync());
      widget.callback({"path":img["path"],"preview":img["file"],"base64":base64Image});
    }
  }


  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Padding(
      padding: scale.getPadding(1,2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GeneralHelper.headerModal(context: context,title: "Ambil gambar dari"),
          // SizedBox(height: scale.getHeight(1)),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:BackgroundIconComponent(
              child: Icon(FontAwesome5Solid.camera,color: Colors.white,),
            ),
            title: Text("Kamera",style: Theme.of(context).textTheme.headline2,),
            trailing: Icon(Icons.arrow_right),
            onTap: ()async{
              final img = await GeneralHelper.getImage("camera");
              toImage(img);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading:BackgroundIconComponent(
              child: Icon(FontAwesome5Solid.image,color: Colors.white,),
            ),
            title: Text("Galeri",style: Theme.of(context).textTheme.headline2,),
            trailing: Icon(Icons.arrow_right),
            onTap: ()async{
              final img = await GeneralHelper.getImage("gallery");
              toImage(img);
            },
          )

        ],
      ),
    );
  }
}
