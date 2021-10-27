import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/profile/pinEditController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class ModalPinEditComponent extends StatefulWidget {
  @override
  _ModalPinEditComponentState createState() => _ModalPinEditComponentState();
}

class _ModalPinEditComponentState extends State<ModalPinEditComponent> {

  bool obscureTextPinLama=true;
  bool obscureTextPinBaru=true;
  bool obscureTextPinConfirmationPin=true;


  @override
  Widget build(BuildContext context) {
    final pinEdit = Provider.of<PinEditController>(context);
    ScreenScaler scale = new ScreenScaler()..init(context);
    return Container(
      height: scale.getHeight(50),
      child: Padding(
        padding: scale.getPadding(1, 2),
        child: Column(
          children: [
            GeneralHelper.headerModal(context: context, title: "Ubah PIN"),
            SizedBox(
              height: scale.getHeight(1),
            ),
            ListView(shrinkWrap: true, children: [
              Container(
                child: FieldComponent(
                  controller: pinEdit.pinOldController,
                  labelText: "PIN Lama",
                  iconPrefix: FontAwesome5Solid.eye,
                  keyboardType: TextInputType.number,
                  onTap: (){
                    setState(() {
                      obscureTextPinLama = !obscureTextPinLama;
                    });
                  },
                  obscureText: obscureTextPinLama,
                  maxLength: 6,
                ),
              ),
              SizedBox(height: scale.getHeight(1)),
              Container(
                child: FieldComponent(
                  controller: pinEdit.pinNewController,
                  labelText: "PIN Baru",
                  iconPrefix: FontAwesome5Solid.eye,
                  keyboardType: TextInputType.number,
                  onTap: (){
                    setState(() {
                      obscureTextPinBaru = !obscureTextPinBaru;
                    });
                  },
                  obscureText: obscureTextPinBaru,
                  maxLength: 6,
                ),
              ),
              SizedBox(height: scale.getHeight(1)),
              Container(
                child: FieldComponent(
                  controller: pinEdit.pinConfirmController,
                  labelText: "Konfirmasi PIN",
                  iconPrefix: FontAwesome5Solid.eye,
                  keyboardType: TextInputType.number,
                  onTap: (){
                    setState(() {
                      obscureTextPinConfirmationPin = !obscureTextPinConfirmationPin;
                    });
                  },
                  obscureText: obscureTextPinConfirmationPin,
                  maxLength: 6,
                ),
              ),
              SizedBox(height: scale.getHeight(1)),
              Container(
                child: ButtonComponent(
                  label: "Simpan",
                  labelColor: Colors.white,
                  backgroundColor: ColorConfig.redPrimary,
                  callback: () =>
                      pinEdit.store(context: context, field: {
                        "pin": pinEdit.pinOldController.text,
                        "pin_new": pinEdit.pinNewController.text,
                        "pin_confirm":
                        pinEdit.pinConfirmController.text,
                      }),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
