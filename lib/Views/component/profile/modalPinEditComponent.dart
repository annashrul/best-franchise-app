import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/profile/pinEditController.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class ModalPinEditComponent extends StatefulWidget {
  @override
  _ModalPinEditComponentState createState() => _ModalPinEditComponentState();
}

class _ModalPinEditComponentState extends State<ModalPinEditComponent> {
  @override
  Widget build(BuildContext context) {
    final pinEdit = Provider.of<PinEditController>(context);
    ScreenScaler scale = new ScreenScaler()..init(context);
    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.75,
        expand: false,
        builder: (_, controller) => Padding(
              padding: scale.getPadding(1, 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ubah PIN",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontSize: 24)),
                      InkResponse(
                        onTap: () {},
                        child: Image.asset(
                          StringConfig.imgLocal + "closeBlack.png",
                          height: scale.getHeight(1),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: scale.getHeight(2)),
                  Expanded(
                    child: ListView(
                        padding: scale.getPadding(1, 2),
                        shrinkWrap: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                // wrap your Column in Expanded
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: FieldComponent(
                                        controller: pinEdit.pinOldController,
                                        labelText: "PIN Lama",
                                      ),
                                    ),
                                    SizedBox(height: scale.getHeight(1)),
                                    Container(
                                      child: FieldComponent(
                                        controller: pinEdit.pinNewController,
                                        labelText: "PIN Baru",
                                      ),
                                    ),
                                    SizedBox(height: scale.getHeight(1)),
                                    Container(
                                      child: FieldComponent(
                                        controller:
                                            pinEdit.pinConfirmController,
                                        labelText: "Konfirmasi PIN",
                                      ),
                                    ),
                                    SizedBox(height: scale.getHeight(1)),
                                    Container(
                                      padding: scale.getPadding(1, 2),
                                      child: ButtonComponent(
                                        label: "Simpan",
                                        labelColor: Colors.white,
                                        backgroundColor: ColorConfig.redPrimary,
                                        // callback: () => pinEdit.store(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ));
  }
}
