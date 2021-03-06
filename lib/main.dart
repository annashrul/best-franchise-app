import 'package:bestfranchise/Configs/apiConfig.dart';
import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/auth/authController.dart';
import 'package:bestfranchise/Controllers/brand/detailBrandController.dart';
import 'package:bestfranchise/Controllers/brand/favoriteBrandController.dart';
import 'package:bestfranchise/Controllers/brand/franchiseController.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Controllers/brand/lokasiBrandController.dart';
import 'package:bestfranchise/Controllers/brand/productBrandController.dart';
import 'package:bestfranchise/Controllers/brand/reviewBrandController.dart';
import 'package:bestfranchise/Controllers/capitalSubmission/capitalSubmissionController.dart';
import 'package:bestfranchise/Controllers/category/categoryBrandController.dart';
import 'package:bestfranchise/Controllers/faq/faqController.dart';
import 'package:bestfranchise/Controllers/fintech/withdrawController.dart';
import 'package:bestfranchise/Controllers/general/generalController.dart';
import 'package:bestfranchise/Controllers/history/progressController.dart';
import 'package:bestfranchise/Controllers/history/statusOrderController.dart';
import 'package:bestfranchise/Controllers/home/notificationController.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/join/joinController.dart';
import 'package:bestfranchise/Controllers/news/listNewsController.dart';
import 'package:bestfranchise/Controllers/news/newsController.dart';
import 'package:bestfranchise/Controllers/profile/imagesProfileController.dart';
import 'package:bestfranchise/Controllers/profile/pinEditController.dart';
import 'package:bestfranchise/Controllers/profile/profileEditController.dart';
import 'package:bestfranchise/Controllers/promo/promoController.dart';
import 'package:bestfranchise/Controllers/redeemPoin/redeemPoinController.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Controllers/reward/komisiController.dart';
import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Controllers/reward/royaltiController.dart';
import 'package:bestfranchise/Controllers/site/companyController.dart';
import 'package:bestfranchise/Controllers/slider/onBoardingController.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  ChangeNotifierProvider<ListBrandController>(
      create: (_) => ListBrandController()),
  ChangeNotifierProvider<ProductBrandController>(
      create: (_) => ProductBrandController()),
  ChangeNotifierProvider<FranchiseController>(
      create: (_) => FranchiseController()),
  ChangeNotifierProvider<ReviewBrandController>(
      create: (_) => ReviewBrandController()),
  ChangeNotifierProvider<LokasiBrandController>(
      create: (_) => LokasiBrandController()),
  ChangeNotifierProvider<CategoryBrandController>(
      create: (_) => CategoryBrandController()),
  ChangeNotifierProvider<StatusOrderController>(
      create: (_) => StatusOrderController()),
  ChangeNotifierProvider<NotificationController>(
      create: (_) => NotificationController()),
  ChangeNotifierProvider<ProgressController>(
      create: (_) => ProgressController()),
  ChangeNotifierProvider<FavoriteBrandController>(
      create: (_) => FavoriteBrandController()),
  ChangeNotifierProvider<OnBoardingController>(
      create: (_) => OnBoardingController()),
  ChangeNotifierProvider<FaqController>(create: (_) => FaqController()),
  ChangeNotifierProvider<PromoController>(create: (_) => PromoController()),
  ChangeNotifierProvider<NewsController>(create: (_) => NewsController()),
  ChangeNotifierProvider<RedeemPoinController>(
      create: (_) => RedeemPoinController()),
  ChangeNotifierProvider<KomisiController>(create: (_) => KomisiController()),
  ChangeNotifierProvider<ImagesProfileController>(
      create: (_) => ImagesProfileController()),
  ChangeNotifierProvider<KomisiController>(create: (_) => KomisiController()),
  ChangeNotifierProvider<RoyaltiController>(create: (_) => RoyaltiController()),
  ChangeNotifierProvider<GeneralController>(create: (_) => GeneralController()),
  ChangeNotifierProvider<CompanyController>(create: (_) => CompanyController()),
];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

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
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('id')
          ],
          theme: ThemeData(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: ColorConfig.greyPrimary,
                ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 1
            ),

            scaffoldBackgroundColor: Colors.white,
            // brightness: Brightness.light,
            unselectedWidgetColor: Colors.grey[300],
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.white,
                modalBackgroundColor: Colors.white),
            primaryColor: Colors.black,
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
