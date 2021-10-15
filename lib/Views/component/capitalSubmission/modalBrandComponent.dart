import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ModalBrandComponent extends StatefulWidget {
  @override
  _ModalBrandComponentState createState() => _ModalBrandComponentState();
}

class _ModalBrandComponentState extends State<ModalBrandComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.75,
        expand: false,
        builder: (_, controller) => Padding(
              padding: scale.getPadding(1, 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pilih Brand",
                          style: Theme.of(context).textTheme.headline1),
                      InkResponse(
                        onTap: () {},
                        child: Image.asset(
                          StringConfig.imgLocal + "closeBlack.png",
                          height: scale.getHeight(1),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                        controller: controller,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: scale.getMarginLTRB(0, 0, 0, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0.5,
                            child: InTouchWidget(
                              radius: 15,
                              callback: () {},
                              child: Container(
                                padding: scale.getPadding(0.5, 2),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 25,
                                      child: Image.network(
                                          "https://www.freepnglogos.com/uploads/b-letter-logo-png-30.png"),
                                    ),
                                    SizedBox(
                                      width: scale.getWidth(2),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Brand",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .copyWith(
                                                  fontWeight: Theme.of(context)
                                                      .textTheme
                                                      .headline2
                                                      .fontWeight),
                                        ),
                                        Text(
                                          "lorem ipsum dolor sit amet",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              .copyWith(
                                                  color:
                                                      ColorConfig.greyPrimary),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox();
                        },
                        itemCount: 30),
                  ),
                ],
              ),
            ));
  }
}
