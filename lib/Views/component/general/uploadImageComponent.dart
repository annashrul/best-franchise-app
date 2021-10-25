import 'dart:convert';
import 'dart:io';

import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class UploadImageComponent extends StatefulWidget {
  final void Function(dynamic data) callback;
  final bool isPreview;
  String titleHeader;
  UploadImageComponent({this.callback,this.isPreview=true,this.titleHeader="Ambil gambar dari"});
  @override
  _UploadImageComponentState createState() => _UploadImageComponentState();
}

class _UploadImageComponentState extends State<UploadImageComponent> {
  File _image;
  dynamic data;
  Future toImage(img)async{
    if(img!=null){
      String fileName;
      String base64Image;
      fileName = img["file"].path.split("/").last;
      var type = fileName.split('.');
      String base64= base64Encode(img["file"].readAsBytesSync());
      print("type ${type[1]}");
      base64Image = 'data:image/' + type[1] + ';base64,' + base64Encode(img["file"].readAsBytesSync());
      final dataImage={"path":img["path"],"preview":img["file"],"base64":base64Image};
      if(!widget.isPreview) widget.callback(dataImage);
      _image=img["file"];
      data=dataImage;
      this.setState(() {});
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
          GeneralHelper.headerModal(context: context,title:widget.titleHeader,callback: ()=>widget.callback(data)),
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
          ),
          if(widget.isPreview)Container(
            padding:EdgeInsets.all(0.0),
            child: _image == null ?SizedBox(): new Image.file(_image,width: MediaQuery.of(context).size.width/1,height: MediaQuery.of(context).size.height/2,filterQuality: FilterQuality.high,),
          ),
        ],
      ),
    );
  }
}
