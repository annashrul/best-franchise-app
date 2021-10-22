import 'package:bestfranchise/Views/widget/auth/loginWidget.dart';
import 'package:bestfranchise/Views/widget/auth/regist/registStep1Component.dart';
import 'package:bestfranchise/Views/widget/auth/regist/registStep2Component.dart';
import 'package:bestfranchise/Views/widget/auth/regist/registStep3Component.dart';
import 'package:bestfranchise/Views/widget/auth/regist/registStep4Component.dart';
import 'package:bestfranchise/Views/widget/auth/regist/verifComponent.dart';
import 'package:bestfranchise/Views/widget/brand/brandFavoriteWidget.dart';
import 'package:bestfranchise/Views/widget/businessPlace/businessPlaceWidget.dart';
import 'package:bestfranchise/Views/widget/capitalSubmission/capitalSubmissionWidget.dart';
import 'package:bestfranchise/Views/widget/manager/managerWidget.dart';
import 'package:bestfranchise/Views/widget/profile/bantuanAplikasiWidget.dart';
import 'package:bestfranchise/Views/widget/profile/profileEditWidget.dart';
import 'package:bestfranchise/Views/widget/profile/tentangAplikasiWidget.dart';
import 'package:bestfranchise/Views/widget/brand/brandWidget.dart';
import 'package:bestfranchise/Views/widget/brand/detailBrandWidget.dart';
import 'package:bestfranchise/Views/widget/fintech/withdraw/formWithdrawWidget.dart';
import 'package:bestfranchise/Views/widget/fintech/withdraw/historyWithdrawWidget.dart';
import 'package:bestfranchise/Views/widget/home/notifWidget.dart';
import 'package:bestfranchise/Views/widget/join/joinWidget.dart';
import 'package:bestfranchise/Views/widget/mainWidget.dart';
import 'package:bestfranchise/Views/widget/news/detailNewsWidget.dart';
import 'package:bestfranchise/Views/widget/onBoardingWidget.dart';
import 'package:bestfranchise/Views/widget/order/detailOrderWidget.dart';
import 'package:bestfranchise/Views/widget/order/historyOrderWidget.dart';
import 'package:bestfranchise/Views/widget/reward/komisiWidget.dart';
import 'package:bestfranchise/Views/widget/reward/poinWidget.dart';
import 'package:bestfranchise/Views/widget/reward/redeemPoinWidget.dart';
import 'package:bestfranchise/Views/widget/reward/royaltiWdiget.dart';
import 'package:bestfranchise/Views/widget/splashScreenWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutePath {
  static const String splashWidget = "/";
  static const String onBoardingWidget = "/onBoardingWidget";
  static const String loginWidget = "/loginWidget";
  static const String registerWidget1 = "/registerWidget1";
  static const String registerWidget2 = "/registerWidget2";
  static const String registerWidget3 = "/registerWidget3";
  static const String registerWidget4 = "/registerWidget4";
  static const String mainWidget = "/mainWidget";
  static const String detailNewsWidget = "/detailNewsWidget";
  static const String notifWidget = "/notifWidget";
  static const String komisiWidget = "/komisiWidget";
  static const String royaltiWidget = "/royaltiWidget";
  static const String poinWidget = "/poinWidget";
  static const String redeemPoinWidget = "/redeemPoinWidget";
  static const String formWithdrawWidget = "/formWithdrawWidget";
  static const String historyWithdrawWidget = "/historyWithdrawWidget";
  static const String brandWidget = "/brandWidget";
  static const String detailBrandWidget = "/detailBrandWidget";
  static const String historyOrderWidget = "/historyOrderWidget";
  static const String detailOrderWidget = "/detailOrderWidget";
  static const String bantuanAplikasiWidget = "/bantuanAplikasiWidget";
  static const String brandFavoriteWidget = "/brandFavoriteWidget";
  static const String tentangAplikasiWidget = "/tentangAplikasiWidget";
  static const String joinWidget = "/joinWidget";
  static const String registWidget = "/registWidget";
  static const String verifWidget = "/verifWidget";
  static const String businessPlaceWidget = "/businessPlaceWidget";
  static const String managerWidget = "/managerWidget";
  static const String capitalSubmissionWidget = "/capitalSubmissionWidget";
  static const String profileEditWidget = "/profileEditWidget";
}

class RouteGenerator {
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
      case RoutePath.detailNewsWidget:
        return CupertinoPageRoute(builder: (_) => DetailNewsWidget(obj: args));
      case RoutePath.notifWidget:
        return CupertinoPageRoute(builder: (_) => NotifWidget());
      case RoutePath.komisiWidget:
        return CupertinoPageRoute(builder: (_) => KomisiWidget());
      case RoutePath.royaltiWidget:
        return CupertinoPageRoute(builder: (_) => RoyaltiWidget());
      case RoutePath.poinWidget:
        return CupertinoPageRoute(builder: (_) => PoinWidget());
      case RoutePath.redeemPoinWidget:
        return CupertinoPageRoute(builder: (_) => RedeemPoinWidget());
      case RoutePath.formWithdrawWidget:
        return CupertinoPageRoute(builder: (_) => FormWithdrawWidget());
      case RoutePath.historyWithdrawWidget:
        return CupertinoPageRoute(builder: (_) => HistoryWithdrawWidget());
      case RoutePath.brandWidget:
        return CupertinoPageRoute(builder: (_) => BrandWidget());
      case RoutePath.detailBrandWidget:
        return CupertinoPageRoute(builder: (_) => DetailBrandWidget(obj: args));
      case RoutePath.historyOrderWidget:
        return CupertinoPageRoute(builder: (_) => HistoryOrderWidget());
      case RoutePath.detailOrderWidget:
        return CupertinoPageRoute(builder: (_) => DetailOrderWidget(obj:args));
      case RoutePath.bantuanAplikasiWidget:
        return CupertinoPageRoute(builder: (_) => BantuanApliaskiWidget());
      case RoutePath.brandFavoriteWidget:
        return CupertinoPageRoute(builder: (_) => BrandFavoriteWidget());
      case RoutePath.tentangAplikasiWidget:
        return CupertinoPageRoute(builder: (_) => TentangAplikasiWidget());
      case RoutePath.joinWidget:
        return CupertinoPageRoute(builder: (_) => JoinWidget(obj: args,));
      case RoutePath.registerWidget1:
        return CupertinoPageRoute(builder: (_) => RegistStep1Widget());
      case RoutePath.registerWidget2:
        return CupertinoPageRoute(builder: (_) => RegistStep2Widget());
      case RoutePath.registerWidget3:
        return CupertinoPageRoute(builder: (_) => RegistStep3Widget());
      case RoutePath.registerWidget4:
        return CupertinoPageRoute(builder: (_) => RegistStep4Widget());
      case RoutePath.verifWidget:
        return CupertinoPageRoute(builder: (_) => VerifWidget());
      case RoutePath.businessPlaceWidget:
        return CupertinoPageRoute(builder: (_) => BusinessPlaceWidget());
      case RoutePath.managerWidget:
        return CupertinoPageRoute(builder: (_) => ManagerWidget());
      case RoutePath.capitalSubmissionWidget:
        return CupertinoPageRoute(builder: (_) => CapitalSubmissionWidget());
      case RoutePath.profileEditWidget:
        return CupertinoPageRoute(builder: (_) => ProfileEditWidget());
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
            children: [Text("Error")],
          ),
        ),
      );
    });
  }
}
