import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/home/bestSolusiComponent.dart';
import 'package:bestfranchise/Views/widget/brand/detailBrandWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class BusinessPlaceWidget extends StatefulWidget {
  @override
  _BusinessPlaceWidgetState createState() => _BusinessPlaceWidgetState();
}

class _BusinessPlaceWidgetState extends State<BusinessPlaceWidget> {
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
          context: context, title: "Informasi tempat usaha"),
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
              onPressed: () {
                GeneralHelper.launchWhatsApp(
                    phone: 6281223165037,
                    message:"Hallo Admin, Saya $fullname berminat untuk bergabung dengan BEST Franchise, apakah ada referensi tempat yang cocok untuk saya? Terima kasih.");
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
      body: Padding(
        padding: scale.getPadding(0, 2),
        child: Center(
          child: Column(
            children: [
              Image.asset(StringConfig.imgLocal + "businessPlace.png"),
              Text(
                "Kamu tidak usah khawatir mengenai tempat jualanmu, konsultasikan dengan kami saja.\n\nSilahkan chat admin kami untuk informasi lebih lengkapnya ya !",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: scale.getHeight(2)),
              slider.sliderHomeSolusiModel == null
                  ? LoadingCardRounded()
                  : BestSolusiComponent(valSl),
              SizedBox(height: scale.getHeight(1)),
            ],
          ),
        ),
      ),
    );
  }
}
