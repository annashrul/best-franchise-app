import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class WrapperComponentRegister extends StatelessWidget {
  final void Function() callback;
  final int step;
  final String caption;
  final Widget child;
  WrapperComponentRegister({this.callback,this.step,this.caption,this.child});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        padding: scale.getPadding(3,2),
        child: ButtonComponent(
          label: this.step<4?"Lanjutkan":"Selesai",
          callback:this.callback,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(StringConfig.imgLocal+"backgroundForm.png")
            )
        ),
        child: Padding(
          padding: scale.getPadding(3, 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: scale.getHeight(2),
              ),
              ClipOval(
                child: InTouchWidget(
                  callback: ()=>Navigator.of(context).pop(),
                  child: Container(
                    color: Colors.black, // button color
                    padding: scale.getPadding(0.4, 1),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: scale.getHeight(2),
              ),
              Padding(
                padding: scale.getPadding(0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Membuat Akun Baru",
                      style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),
                    ),
                    SizedBox(
                      height: scale.getHeight(1),
                    ),
                    Text(
                      "Langkah $step",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      this.caption,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: scale.getHeight(2),
              ),
              this.child

            ],
          ),
        ),
      ),
    );
  }
}
