import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class LokasiBrandComponent extends StatefulWidget {
  @override
  _LokasiBrandComponentState createState() => _LokasiBrandComponentState();
}

class _LokasiBrandComponentState extends State<LokasiBrandComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);

    return Stack(
      children: [
        Center(
          child: Container(
            padding: scale.getPadding(1,2),
            child: Image.asset(StringConfig.imgLocal+"maps.png",fit: BoxFit.cover,),
          ),
        ),
        Container(
          padding: scale.getPadding(2,4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white.withOpacity(0.9),
                margin:EdgeInsets.zero,
                child: Padding(
                  padding: scale.getPadding(1,2),
                  child: Text("Lokasi Kamu : Neptunus Barat 1 Blok A16 No. 1, Buahbatu ...",style: Theme.of(context).textTheme.headline3,),
                ),
              ),
              SizedBox(height: scale.getHeight(1),),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin:EdgeInsets.zero,
                child: Padding(
                  padding: scale.getPadding(1,2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lokasi Outlet Terdekat",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w500)),
                      SizedBox(height: scale.getHeight(1),),
                      ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return Container(
                              padding: scale.getPadding(0,0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(StringConfig.imgGeneral,height: scale.getHeight(5),),
                                  ),
                                  SizedBox(width: scale.getWidth(2),),
                                  Expanded(
                                    child: Text("Jl. Peta No.241, Suka Asih,Kec. Bojongloa Kaler, Kota Bandung Jawa Barat  40232 Phone : 022-6646137",style: Theme.of(context).textTheme.headline2,),
                                  )

                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context,index){return SizedBox(height: scale.getHeight(1),child: Divider(),);},
                          itemCount: 5
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
