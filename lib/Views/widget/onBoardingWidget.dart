import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import '../component/general/buttonComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: scale.getPadding(0, 10),
                  child: Text("Selamat datang di Aplikasi BEST Brand & Franchise",style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage(StringConfig.imgLocal+"Blob.png"),
                    )
                  ),
                  child: Image.asset(StringConfig.imgLocal+"Finances.png"),
                ),
                Padding(
                  padding: scale.getPadding(0, 10),
                  child: Text("Dapatkan penghasilan tambahan sekarang",style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: scale.getPadding(1, 10),
                  child: Text("Dapatkan berbagai jenis usaha yang sesuai dengan zamannya dan sangat mudah dijalankan dengan dukungan tekhnologi",style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,),
                ),

                Padding(
                  padding: scale.getPadding(2, 10),
                  child: ButtonComponent(
                    label: "Login",
                    callback: ()=>Navigator.of(context).pushNamed(RoutePath.loginWidget),
                  ),
                ),
                Padding(
                  padding: scale.getPadding(0, 10),
                  child: ButtonComponent(
                    label: "Register",
                    backgroundColor: ColorConfig.blueSecondary,
                    labelColor: Colors.white,
                    callback: (){},
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
