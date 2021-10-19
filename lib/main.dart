import 'package:bestfranchise/Configs/apiConfig.dart';
import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/auth/authController.dart';
import 'package:bestfranchise/Controllers/brand/detailBrandController.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Controllers/capitalSubmission/capitalSubmissionController.dart';
import 'package:bestfranchise/Controllers/fintech/withdrawController.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/join/joinController.dart';
import 'package:bestfranchise/Controllers/news/listNewsController.dart';
import 'package:bestfranchise/Controllers/profile/pinEditController.dart';
import 'package:bestfranchise/Controllers/profile/profileEditController.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ListNewsController>(
      create: (_) => ListNewsController()),
  ChangeNotifierProvider<PoinController>(create: (_) => PoinController()),
  ChangeNotifierProvider<WithdrawController>(
      create: (_) => WithdrawController()),
  ChangeNotifierProvider<DetailBrandController>(
      create: (_) => DetailBrandController()),
  ChangeNotifierProvider<JoinController>(create: (_) => JoinController()),
  ChangeNotifierProvider<RegistController>(create: (_) => RegistController()),
  ChangeNotifierProvider<CapitalSubmissionController>(
      create: (_) => CapitalSubmissionController()),
  ChangeNotifierProvider<ProfileEditController>(
      create: (_) => ProfileEditController()),
  ChangeNotifierProvider<PinEditController>(create: (_) => PinEditController()),
  ChangeNotifierProvider<SliderHomeController>(
      create: (_) => SliderHomeController()),
  ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
  ChangeNotifierProvider<UserController>(create: (_) => UserController()),
  ChangeNotifierProvider<ListBrandController>(
      create: (_) => ListBrandController()),
  ChangeNotifierProvider<RewardHomeController>(
      create: (_) => RewardHomeController()),
];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CoreDatabases db = new CoreDatabases();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };
    OneSignal.shared.init(ApiConfig.onesignalAppId, iOSSettings: settings);
    db.openDB();
    final user = Provider.of<UserController>(context, listen: false);
    user.getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.poppins();
    return OKToast(
        textStyle: style.copyWith(
            fontSize: 10.0, fontWeight: FontWeight.w500, color: Colors.white),
        backgroundColor: Colors.grey,
        radius: 10.0,
        animationCurve: Curves.easeIn,
        animationBuilder: const Miui10AnimBuilder(),
        animationDuration: const Duration(milliseconds: 200),
        duration: const Duration(seconds: 3),
        child: MaterialApp(
          title: ApiConfig.siteName,
          initialRoute: RoutePath.splashWidget,
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: ColorConfig.greyPrimary,
                ),
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            brightness: Brightness.light,
            unselectedWidgetColor: Colors.grey[300],
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.white,
                modalBackgroundColor: Colors.white),
            textTheme: TextTheme(
              button: style.copyWith(color: Colors.white),
              bodyText1: style.copyWith(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: ColorConfig.blackPrimary),
              headline1: style.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: ColorConfig.blackPrimary),
              headline2: style.copyWith(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: ColorConfig.blackPrimary),
              headline3: style.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConfig.blackPrimary),
              headline4: style.copyWith(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConfig.blackPrimary),
              headline5: style.copyWith(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConfig.blackPrimary),
            ),
          ),
          builder: (BuildContext context, Widget child) {
            final MediaQueryData data = MediaQuery.of(context);
            ScreenScaler scaler = ScreenScaler()..init(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: scaler.getTextSize(2)),
              child: child,
            );
          },
        ));
  }
}
