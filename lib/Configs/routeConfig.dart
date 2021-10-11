
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/widget/auth/loginComponent.dart';
import 'package:bestfranchise/Views/widget/mainWidget.dart';
import 'package:bestfranchise/Views/widget/onBoardingWidget.dart';
import 'package:bestfranchise/Views/widget/splashScreenWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args);
    switch (settings.name) {
      case RoutePath.splashWidget:
        return CupertinoPageRoute(builder: (_) => SplashScreenWidget());
      case RoutePath.onBoardingWidget:
        return CupertinoPageRoute(builder: (_) => OnBoardingWidget());
      case RoutePath.loginWidget:
        return CupertinoPageRoute(builder: (_) => LoginWidget());
      case RoutePath.mainWidget:
        return CupertinoPageRoute(builder: (_) => MainWidget(indexTab: args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Error")
            ],
          ),
        ),
      );
    });
  }
}

class RoutePath{
  static const String splashWidget = "/";
  static const String onBoardingWidget = "/onBoardingWidget";
  static const String loginWidget = "/loginWidget";
  static const String registerWidget = "/registerWidget";
  static const String mainWidget = "/mainWidget";
}