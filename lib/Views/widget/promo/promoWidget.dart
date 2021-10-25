import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Controllers/promo/promoController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class PromoWidget extends StatefulWidget {
  @override
  _PromoWidgetState createState() => _PromoWidgetState();
}

class _PromoWidgetState extends State<PromoWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final promo = Provider.of<PromoController>(context, listen: false);
    promo.loadPromo(context: context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final promo = Provider.of<PromoController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarWithImage(
          context: context, desc: "Promo untuk kamu"),
      body: promo.isLoading
          ? BaseLoadingLoop(
              child: LoadingCardRounded(),
            )
          : promo.promoModel == null
              ? NoDataComponent()
              : ListView.separated(
                  padding: scale.getPadding(1, 2),
                  itemBuilder: (context, index) {
                    final val = promo.promoModel.data[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 0.0,
                                offset: Offset(0.1, 1.0),
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0)),
                              child: Image.network(
                                val.banner,
                                height: scale.getHeight(10),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: scale.getPadding(1, 2),
                              child: Wrap(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(val.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1),
                                      Text(
                                          "Expired : " +
                                              GeneralHelper.myDate(
                                                  val.expiredDate),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    ],
                                  ),
                                  Text(val.caption,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(
                                              color: ColorConfig.greyPrimary)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: scale.getPadding(1, 2),
                              child: SizedBox(
                                width: scale.getWidth(30),
                                child: ButtonComponent(
                                  height: 3,
                                  labelColor: Colors.white,
                                  backgroundColor: ColorConfig.bluePrimary,
                                  label: val.code.toUpperCase(),
                                  callback: () {
                                    GeneralHelper.myCopyClipboard(
                                        context, val.code);
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: scale.getHeight(1));
                  },
                  itemCount: promo.promoModel.data.length),
      // ********************** LOADMORE **********************//
      // bottomNavigationBar: Container(
      //   height: scale.getHeight(10),
      //   child: CupertinoActivityIndicator(),
      // ),
    );
  }
}
