import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/home/bestSolusiComponent.dart';
import 'package:bestfranchise/Views/widget/brand/detailBrandWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class BusinessPlaceWidget extends StatefulWidget {
  final Map<dynamic, dynamic> obj;
  BusinessPlaceWidget({this.obj});
  @override
  _BusinessPlaceWidgetState createState() => _BusinessPlaceWidgetState();
}

class _BusinessPlaceWidgetState extends State<BusinessPlaceWidget> {
  @override
  void initState() {
    // TODO: implement initState
    final slider = Provider.of<SliderHomeController>(context, listen: false);
    slider.getSolusi(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final slider = Provider.of<SliderHomeController>(context);
    final info = Provider.of<RewardHomeController>(context);
    final user = Provider.of<UserController>(context);
    final valSl = slider.sliderHomeSolusiModel == null
        ? []
        : slider.sliderHomeSolusiModel.data;

    var fullname = user.dataUser[UserTable.fullname];
    var wa_admin = info.infoModel.data.waAdmin;
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context, title: "Informasi Tempat Usaha"),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Container(
          padding: scale.getPadding(1, 2),
          child: FlatButton(
              padding: scale.getPadding(1, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              color: ColorConfig.redPrimary,
              onPressed: () async {
                await GeneralHelper.sendWa(
                    context: context,
                    no: wa_admin,
                    msg:"Hallo Admin, Saya $fullname ada beberapa hal yang ingin saya tanyakan, mohon agar segera di respon. Terima kasih.");
              },
              child: Text(
                "Whatsapp kami",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: Colors.white),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: scale.getPadding(1, 2),
        // shrinkWrap: true,
        children: [
          Image.network(widget.obj["banner"]),
          Text(
            widget.obj["caption"],
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: scale.getHeight(1)),
          Text(
            "Kamu tidak usah khawatir mengenai tempat jualanmu, konsultasikan dengan kami saja.",
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: scale.getHeight(1)),
          Text(
            "Silahkan chat admin kami untuk informasi lebih lengkapnya ya !",
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: scale.getHeight(2)),
          slider.sliderHomeSolusiModel == null
              ? LoadingCardRounded()
              : BestSolusiComponent(valSl),
          SizedBox(height: scale.getHeight(1)),
        ],
      )
    );
  }
}
