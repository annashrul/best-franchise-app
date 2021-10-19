import 'package:bestfranchise/Configs/apiConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Views/widget/auth/otpWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  AssetImage assetImage;

  Future checkingRoute() async {
    CoreDatabases db = new CoreDatabases();
    await Future.delayed(Duration(seconds: 2));
    final user = Provider.of<UserController>(context, listen: false).dataUser;
    final countUser = await db.getData(UserTable.TABLE_NAME);
    // print("################## DATA USER = ${user.dataUser}");
    // Navigator.of(context).pushNamed(RoutePath.mainWidget,arguments: StringConfig.tabHome);
    if (countUser.length > 0) {
      // ApiConfig.head["Authorization"] = "Bearer ${user[UserTable.token]}";
      // if(user[UserTable.statusRoleApp]==StringConfig.statusLogoutAplikasi){
      //   Navigator.of(context).pushNamedAndRemoveUntil(RoutePath.loginWidget, (route) => false);
      // }
      // else{
      Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePath.mainWidget, (route) => false,
          arguments: StringConfig.tabHome);
      // }
    } else {
      Navigator.of(context).pushNamed(RoutePath.onBoardingWidget);
    }

    // Navigator.of(context).push(CupertinoPageRoute(builder: (_) => OtpWidget(
    //   callback: (code){
    //
    //   },
    //   isTrue: false,
    //   otp: "0000",
    // )));
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
        decoration: BoxDecoration(image: DecorationImage(image: assetImage)),
      ),
    );
  }
}
