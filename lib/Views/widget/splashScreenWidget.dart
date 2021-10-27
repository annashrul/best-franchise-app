import 'package:bestfranchise/Configs/apiConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
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
    final user = Provider.of<UserController>(context, listen: false);
    final countUser = await db.getData(UserTable.TABLE_NAME);
    if (countUser.length > 0) {
      print("STATUS USER = ${user.dataUser[UserTable.statusRoleApp]}");
      final isToken = await GeneralHelper.isTokenExpired(context);
      if(isToken){
        GeneralHelper.processLogout(context);
      }
      else if(user.dataUser[UserTable.statusRoleApp] == "${StringConfig.statusLogoutAplikasi}"){
        Navigator.of(context).pushNamedAndRemoveUntil(RoutePath.loginWidget, (route) => false);
      }
      else if(user.dataUser[UserTable.statusRoleApp] == "${StringConfig.statusKeluarDariAplikasi}"){
        Navigator.of(context).pushNamedAndRemoveUntil( RoutePath.mainWidget, (route) => false,arguments: StringConfig.tabHome);
      }
      else{
        Navigator.of(context).pushNamedAndRemoveUntil( RoutePath.mainWidget, (route) => false,arguments: StringConfig.tabHome);
      }
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(RoutePath.onBoardingWidget, (route) => false);
    }
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
