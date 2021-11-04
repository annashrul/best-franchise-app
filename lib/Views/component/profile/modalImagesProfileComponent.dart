import 'dart:io';

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/profile/imagesProfileController.dart';
import 'package:bestfranchise/Controllers/profile/pinEditController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/general/uploadImageComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ModalImagesProfileComponent extends StatefulWidget {
  @override
  _ModalImagesProfileComponentState createState() =>
      _ModalImagesProfileComponentState();
}

List dataPhoto = [
  {"title": "Ubah Profile", "img": "", "required": "true", "base64": ""},
  {"title": "Ganti Sampul", "img": "", "required": "true", "base64": ""},
];

class _ModalImagesProfileComponentState
    extends State<ModalImagesProfileComponent> {
  @override
  Widget build(BuildContext context) {
    final imagesProfile = Provider.of<ImagesProfileController>(context);
    ScreenScaler scale = new ScreenScaler()..init(context);
    return Container(
      padding: scale.getPadding(1, 2),
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GeneralHelper.headerModal(context: context, title: "Ubah Gambar"),
          SizedBox(
            height: scale.getHeight(1),
          ),
          StaggeredGridView.countBuilder(
            padding: EdgeInsets.all(0.0),
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 2,
            itemCount: dataPhoto.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  margin: EdgeInsets.zero,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: InTouchWidget(
                    radius: 15,
                    callback: () async {
                      GeneralHelper.modal(
                          context: context,
                          child: UploadImageComponent(
                            callback: (data) {
                              Navigator.of(context).pop();
                              dataPhoto[index]["img"] = data["path"];
                              dataPhoto[index]["base64"] = data["base64"];
                              setState(() {});
                            },
                          ));
                    },
                    child: dataPhoto[index]["img"] != ""
                        ? Image.file(
                      File(dataPhoto[index]["img"]),
                    )
                        : Container(
                        padding: scale.getPadding(3, 2),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: <Widget>[
                              BackgroundIconComponent(
                                child: Icon(FontAwesome5Solid.camera,
                                    color: Colors.white,
                                    size: scale.getTextSize(15)),
                              ),
                              SizedBox(height: 20),
                              Text(
                                dataPhoto[index]["title"],
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2,
                              ),
                              if (dataPhoto[index]["required"] ==
                                  "false")
                                Text(
                                  "( Opsional )",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2,
                                )
                            ],
                          ),
                        )),
                  ));
            },
            staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          SizedBox(height: scale.getHeight(1)),
          Container(
            padding: scale.getPadding(1, 0),
            child: ButtonComponent(
              label: "Simpan",
              labelColor: Colors.white,
              backgroundColor: ColorConfig.redPrimary,
              callback: ()async{
                // Navigator.of(context).pop();
                await imagesProfile.store(context, dataPhoto);
                dataPhoto[0]["img"]="";
                dataPhoto[1]["img"]="";
                this.setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
