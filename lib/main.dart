import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/news/listNewsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ListNewsController>(create: (_) => ListNewsController()),
];

void main() {
  runApp(
    MultiProvider(
      providers:providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.poppins();
    return MaterialApp(
      title: 'n-shop',
      initialRoute: RoutePath.splashWidget,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        unselectedWidgetColor: Colors.grey[300],
        bottomSheetTheme: BottomSheetThemeData(backgroundColor:Colors.white,modalBackgroundColor:Colors.white),
        textTheme: TextTheme(
          button: style.copyWith(color: Colors.white),
          headline1: style.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: ColorConfig.blackPrimary),
          headline2: style.copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: ColorConfig.blackPrimary),
          headline3: style.copyWith(fontSize: 12.0, fontWeight: FontWeight.w500, color: ColorConfig.blackPrimary),
          headline4: style.copyWith(fontSize: 10.0, fontWeight: FontWeight.w500, color: ColorConfig.blackPrimary),
          headline5: style.copyWith(fontSize: 8.0, fontWeight: FontWeight.w500, color: ColorConfig.blackPrimary),
        ),
      ),
      builder: (BuildContext context, Widget child){
        final MediaQueryData data = MediaQuery.of(context);
        ScreenScaler scaler = ScreenScaler()..init(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor:scaler.getTextSize(2)),
          child: child,
        );
      },
    );

  }
}
