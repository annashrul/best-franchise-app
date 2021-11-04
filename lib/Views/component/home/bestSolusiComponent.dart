import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeSolusiModel.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class BestSolusiComponent extends StatefulWidget {
  final List<Datum> valSl;
  BestSolusiComponent(this.valSl);

  @override
  _BestSolusiComponentState createState() => _BestSolusiComponentState();
}

class _BestSolusiComponentState extends State<BestSolusiComponent> {

  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final route = Provider.of<SliderHomeController>(context,listen: false);
    print("PROVIDER ${route.route}");
    List dataAsli=[];
    final data = widget.valSl;
    data.forEach((element) {
      if(element.route!=route.route){
        dataAsli.add( {
          "id": element.id,
          "type": element.type,
          "status": element.status,
          "route":element.route,
          "id_route": element.idRoute,
          "title":element.title,
          "caption": element.caption,
          "link":element.link,
          "bg_color": element.bgColor,
          "banner": element.banner,
        });
      }
    });
    return Container(
      margin: scale.getMarginLTRB(0, 0, 0, 0),
      height: scale.getHeight(13),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:dataAsli.length,
        itemBuilder: (context, index) {
          final val = dataAsli[index];
          return InTouchWidget(
              radius: 10,
              callback: () {
                if (val["route"] == "pengelola") {
                  route.setRoute("pengelola");
                  Navigator.of(context).pushNamed(RoutePath.managerWidget,arguments: val).whenComplete((){
                    route.setRoute("");

                    GeneralHelper.backToMain(context: context,tab: StringConfig.tabHome);
                    print("KEMBALI KE HALAMAN PENGELOLA");
                  });
                } else if (val["route"] == "tempat") {
                  route.setRoute("tempat");
                  Navigator.of(context).pushNamed(RoutePath.businessPlaceWidget,arguments: val).whenComplete((){
                    route.setRoute("");
                    GeneralHelper.backToMain(context: context,tab: StringConfig.tabHome);
                    print("KEMBALI KE HALAMAN TEMPAT");
                  });
                } else if (val["route"] == "modal") {
                  Navigator.of(context).pushNamed(RoutePath.capitalSubmissionWidget,arguments: val).whenComplete(() => route.setRoute(""));
                } else {
                  Navigator.of(context).pushNamed(RoutePath.joinWidget, arguments: {});
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: val["bg_color"] == "-"
                        ? Color(0xFFCEDAFA)
                        : HexColor(val["bg_color"]),
                    borderRadius: BorderRadius.circular(10)),
                // padding: scale.getPadding(0.5,1),
                width: scale.getWidth(70),
                child: Padding(
                  padding: scale.getPadding(1, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: scale.getWidth(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              val["title"],
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              val["caption"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(color: Colors.black45),
                            ),
                            Text(
                              "Klik disini",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(color: ColorConfig.bluePrimary),
                            ),
                          ],
                        ),
                      ),
                      Image.network(val["banner"])
                    ],
                  ),
                ),
                // child: R,
              ));
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: scale.getWidth(1));
        },
      ),
    );
  }
}
