import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/slider/onBoardingController.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../component/general/buttonComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  int _current = 0;
  List data = [{"image":""},{"image":""}];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final onBoarding = Provider.of<OnBoardingController>(context,listen: false);
    onBoarding.loadData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final onBoarding = Provider.of<OnBoardingController>(context);
    print(onBoarding.sliderOnBoardingModel);
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(StringConfig.imgLocal+"backgroundForm.png")
            )
        ),
        child: Center(
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
                    child: Text(
                      "Selamat datang di Aplikasi BEST Brand & Franchise",
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onBoarding.isLoading?Container():Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          viewportFraction: 1.0,
                          height: scale.getHeight(51),
                          onPageChanged: (index, reason) {
                            print(index);
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        items: onBoarding.sliderOnBoardingModel.data.map((slide) {
                          return Column(
                            children: [
                              Container(
                                margin:scale.getMargin(5,0),
                                child: CachedNetworkImage(
                                  height: scale.getHeight(20),
                                  fit: BoxFit.contain,
                                  imageUrl: slide.banner,
                                  placeholder: (context, url) =>BaseLoading(height: 20, width: 50,radius: 10,),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                //
                                // child: Image.network(
                                //     slide.banner,
                                //     fit:BoxFit.contain,
                                //   height: scale.getHeight(20),
                                // ),
                              ),
                              Padding(
                                padding: scale.getPadding(0, 10),
                                child: Text(
                                  slide.title,
                                  style: Theme.of(context).textTheme.headline1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: scale.getPadding(1, 10),
                                child: Text(
                                  slide.caption,
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                      if(onBoarding.sliderOnBoardingModel.data.length>1)Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: onBoarding.sliderOnBoardingModel.data.map((slide) {
                            return Container(
                              width: 10.0,
                              height: 3.0,
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  color: _current == onBoarding.sliderOnBoardingModel.data.indexOf(slide) ? Theme.of(context).hintColor: Theme.of(context).hintColor.withOpacity(0.3)),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: scale.getPadding(2, 10),
                    child: ButtonComponent(
                      label: "Login",
                      callback: () =>
                          Navigator.of(context).pushNamedAndRemoveUntil(RoutePath.loginWidget, (route) => false)
                          // Navigator.of(context).pushNamed(RoutePath.loginWidget),
                    ),
                  ),
                  Padding(
                    padding: scale.getPadding(0, 10),
                    child: ButtonComponent(
                      label: "Register",
                      backgroundColor: ColorConfig.blueSecondary,
                      labelColor: Colors.white,
                      callback: () =>
                          // Navigator.of(context).pushNamedAndRemoveUntil(RoutePath.registerWidget1, (route) => false)

                        Navigator.of(context).pushNamed(RoutePath.registerWidget1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
