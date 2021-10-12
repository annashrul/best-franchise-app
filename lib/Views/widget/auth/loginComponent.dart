import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: scale.getPadding(3,2),
           child: ButtonComponent(
          label: "Login",
          callback: (){
            Navigator.of(context).pushNamed(RoutePath.mainWidget,arguments: StringConfig.tabHome);
          },
        ),
      ),
      body: Padding(
        padding: scale.getPadding(3,2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: scale.getHeight(2),),
            ClipOval(
              child:Container(
                color: Colors.black, // button color
                padding: scale.getPadding(0.4, 1),
                child: Icon(Icons.arrow_back,color: Colors.white,),
              ),
            ),
            SizedBox(height: scale.getHeight(2),),
            Padding(
              padding: scale.getPadding(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",style: Theme.of(context).textTheme.headline1.copyWith(fontSize:24 ),),
                  SizedBox(height: scale.getHeight(1),),
                  Text("Masukkan nomor handphone dan PIN yang sudah kamu daftarkan",style: Theme.of(context).textTheme.headline2,),
                ],
              ),
            ),
            SizedBox(height: scale.getHeight(2),),
            Container(
              width: double.infinity,
              padding:scale.getPadding(0,2),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF1E2188)),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: scale.getWidth(20),
                    child: CountryCodePicker(
                      onChanged: (CountryCode  countryCode){

                      },
                      initialSelection: 'ID',
                      favorite: ['+62','ID'],
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: true,
                      textStyle:Theme.of(context).textTheme.headline2,

                    ),
                  ),
                  Container(
                    width:scale.getWidth(50),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.headline2,
                      // controller: _noHpController,
                      maxLines: 1,
                      autofocus: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: Theme.of(context).textTheme.headline2.copyWith(color: Color(0xFFD0CACA)),
                          hintText: "Masukan nomor handphone"
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
