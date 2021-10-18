import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailOrderWidget extends StatefulWidget {
  @override
  _DetailOrderWidgetState createState() => _DetailOrderWidgetState();
}

class _DetailOrderWidgetState extends State<DetailOrderWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
        context: context,
        title: "Progress"
      ),
      body: ListView(
        padding: scale.getPadding(1,2),
        children: [
          Container(
            padding: scale.getPadding(1,2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(StringConfig.imgLocal+"backCardReward.png")
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(StringConfig.imgLocal+"burhot.png"),
                SizedBox(width: scale.getWidth(2)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSpaceBetween("Kode Order", "BH0101"),
                      textSpaceBetween("Nama Pemilik", "Kayla Andhara"),
                      textSpaceBetween("Tipe Investasi", "Outlet 100M2"),
                      textSpaceBetween("Tanggal Order", "2020-01-01"),
                      textSpaceBetween("Estimasi Opening", "2020-01-01"),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: scale.getHeight(1),),
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              elevation: 1,
              margin: EdgeInsets.zero,
              child: new LinearPercentIndicator(
                padding: scale.getPadding(0,3),
                center: Text(
                  "50.0%",
                  style: Theme.of(context).textTheme.headline1,
                ),
                width:385.0,
                lineHeight: 40,
                percent: 0.5,
                backgroundColor: Colors.white,
                progressColor: Color(0xFFFF7E7E),
              ),
            ),
          ),
          ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return InTouchWidget(
                  radius: 15,
                  callback: (){},
                  child: Padding(
                    padding: scale.getPadding(1,0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:30 ,
                          backgroundImage: NetworkImage(StringConfig.imgGeneral),
                        ),
                        SizedBox(width: scale.getWidth(2),),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Survey Lokasi",style: Theme.of(context).textTheme.headline2),
                                    Text("Jenis pekerjaan kunjungan untuk memastikan kondisi tempat dan penjelasan kerjasama",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
                                  ],
                                ),
                              ),
                              new CircularPercentIndicator(
                                radius: 60.0,
                                lineWidth: 10.0,
                                percent: 0.60,
                                backgroundWidth: 1,
                                center: new Text("60%",style: Theme.of(context).textTheme.headline2,),
                                progressColor: ColorConfig.redPrimary,

                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context,index){return Divider();},
              itemCount: 5
          )

        ],
      ),
    );
  }

  Widget textSpaceBetween(title,desc){
    ScreenScaler scale = ScreenScaler()..init(context);
    return Row(
      children: [
        Container(
          width: scale.getWidth(30),
          child:Text(title,style: Theme.of(context).textTheme.headline2),
        ),
        Container(
          width: scale.getWidth(5),
          child: Text(":",style: Theme.of(context).textTheme.headline2),
        ),
        Text(desc,style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
      ],
    );
  }

}
