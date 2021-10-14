import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  AssetImage assetImage;

  Future checkingRoute()async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushNamed(RoutePath.mainWidget,arguments: StringConfig.tabHome);
    // Navigator.of(context).pushNamed(RoutePath.onBoardingWidget);
  }

  @override
  void initState() {
    super.initState();
    assetImage = AssetImage("${StringConfig.imgLocal}Splash.png");
    checkingRoute();
  }
  @override
  void didChangeDependencies() {
    precacheImage(assetImage, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(image: assetImage)
        ),
      ),
    );
  }
}
