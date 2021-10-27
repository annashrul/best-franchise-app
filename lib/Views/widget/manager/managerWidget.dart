import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/home/bestSolusiComponent.dart';
import 'package:bestfranchise/Views/component/manager/managerComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class ManagerWidget extends StatefulWidget {
  @override
  _ManagerWidgetState createState() => _ManagerWidgetState();
}

class _ManagerWidgetState extends State<ManagerWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final slider = Provider.of<SliderHomeController>(context, listen: false);
    slider.getSolusi(context: context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final slider = Provider.of<SliderHomeController>(context);
    final user = Provider.of<UserController>(context);
    final valSl = slider.sliderHomeSolusiModel == null
        ? []
        : slider.sliderHomeSolusiModel.data;
    var fullname = user.dataUser[UserTable.fullname];
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context, title: "Informasi Pengelola"),
      body: Center(
        child: ListView(
          padding: scale.getPadding(1, 2),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Image.asset(StringConfig.imgLocal + "imageManager.png"),
            Text(
              "Bingung mengelola usaha kamu? Yuk konsultasikan kepada kami, karena kami mempunyai orang yang handal untuk memajukan bisnis kamu.",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: scale.getHeight(2)),
            slider.sliderHomeSolusiModel == null
                ? LoadingCardRounded()
                : BestSolusiComponent(valSl),
            SizedBox(height: scale.getHeight(1)),
            ButtonComponent(
              label: "Whatsapp kami",
              labelColor: Colors.white,
              backgroundColor: ColorConfig.redPrimary,
              callback: () {
                GeneralHelper.launchWhatsApp(
                    phone: 6281223165037,
                    message:
                        "Hallo Admin, Saya $fullname berminat untuk bergabung dengan BEST Franchise, apakah ada referensi pengelola yang cocok untuk saya? Terima kasih.");
              },
            )
          ],
        ),
      ),
    );
  }
}
