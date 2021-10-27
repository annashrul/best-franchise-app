import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:intl/intl.dart';

class CardPoin extends StatelessWidget {
  final String title;
  final String telp;
  final String subtitle;
  final String imgUser;
  final String status;
  final String valStatus;
  final String logoBrand;
  CardPoin(
      {this.title,
      this.subtitle,
      this.telp,
      this.imgUser,
      this.status,
      this.logoBrand,
      this.valStatus});

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);

    return Card(
      margin: scale.getMarginLTRB(0, 0, 0, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: InTouchWidget(
        radius: 15,
        callback: () async{
          await GeneralHelper.sendWa(
              context: context,
              no:telp,
              msg: "Terima kasih telah menjadi Franchise kami, semoga bisnis anda lancar selalu."
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: scale.getPaddingLTRB(2, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(this.imgUser),
                        radius: 15,
                      ),
                      SizedBox(
                        width: scale.getWidth(1),
                      ),
                      Column(
                        children: [
                          Container(
                            width: scale.getWidth(55),
                            child: Text(this.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            width: scale.getWidth(55),
                            child: Text(this.telp,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(fontWeight: FontWeight.w500)),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ],
                  ),
                  Container(
                    width: scale.getWidth(60),
                    height: scale.getHeight(1),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 15,
                        child:
                            Image.asset(StringConfig.imgLocal + "whatsApp.png"),
                      ),
                      SizedBox(
                        width: scale.getWidth(1),
                      ),
                      Container(
                        width: scale.getWidth(50),
                        child: Text(this.subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(fontWeight: FontWeight.w500),
                            maxLines: 1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              child: Container(
                padding: scale.getPadding(1, 2),
                height: scale.getHeight(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(this.status,style: Theme.of(context).textTheme.headline2),
                    Text(this.valStatus,style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey)),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color(0xFFABF2B3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
