import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class DetailNewsWidget extends StatefulWidget {
  final dynamic obj;
  DetailNewsWidget({this.obj});
  @override
  _DetailNewsWidgetState createState() => _DetailNewsWidgetState();
}

class _DetailNewsWidgetState extends State<DetailNewsWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(context: context,title: "“INDONESIA LEADERSHIP & CORPORATE "),
      body: Stack(
        children: [
          Image.network(StringConfig.imgGeneral),
          Container(
            margin: scale.getMarginLTRB(0,20, 0,0),
            height: scale.getHeight(70),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),)
            ),
            child: ListView(
              shrinkWrap: true,
              padding: scale.getPadding(1,2),
              children: [
                Text("INDONESIA LEADERSHIP & CORPORATE AWARD WINNER 2018 kepada Bapak Bhakti Desta Alamsyah",style: Theme.of(context).textTheme.headline2,),
                SizedBox(height: scale.getHeight(1)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: scale.getPadding(0.5,2),
                      decoration: BoxDecoration(
                          color: ColorConfig.redPrimary,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Kontibutor : Amang Saleh",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
                    ),
                    Text("Admin, 2020-01-01",style: Theme.of(context).textTheme.headline3)
                  ],
                ),
                SizedBox(height: scale.getHeight(1)),
                Text("Bhakti Desta Alamsyah dalam urusan ini akhirnya saya punya kesimpulan, barangkali sebab kemuliaan ilmu tersebut yang mengantarkan beliau dalam waktu relatif singkat sejak 2009 usaha RFC miliknya melesat, hingga pada 2011 dianugerahi gelar The Fastest Growing Franchise 2011 oleh Majalah Info Franchise. Tak lama berselang usaha yang lain pun bermunculan seperti Juper Fried Chicken, Pesta Pizza, Tokiyo Bento dan Nasgor Jedar yang hingga kini total mencapai 150an cabang store yang tersebar dari pulau terluar Natuna hingga pulau terujung Buru Maluku bahkan hingga ke Negara Timor Leste. Bhakti Desta Alamsyah dalam urusan ini akhirnya saya punya kesimpulan, barangkali sebab kemuliaan ilmu tersebut yang mengantarkan beliau dalam waktu relatif singkat sejak 2009 usaha RFC miliknya melesat, hingga pada 2011 dianugerahi gelar The Fastest Growing Franchise 2011 oleh Majalah Info Franchise. Tak lama berselang usaha yang lain pun bermunculan seperti Juper Fried Chicken, Pesta Pizza, Tokiyo Bento dan Nasgor Jedar yang hingga kini total mencapai 150an cabang store yang tersebar dari pulau terluar Natuna hingga pulau terujung Buru Maluku bahkan hingga ke Negara Timor Leste.Bhakti Desta Alamsyah dalam urusan ini akhirnya saya punya kesimpulan, barangkali sebab kemuliaan ilmu tersebut yang mengantarkan beliau dalam waktu relatif singkat sejak 2009 usaha RFC miliknya melesat, hingga pada 2011 dianugerahi gelar The Fastest Growing Franchise 2011 oleh Majalah Info Franchise. Tak lama berselang usaha yang lain pun bermunculan seperti Juper Fried Chicken, Pesta Pizza, Tokiyo Bento dan Nasgor Jedar yang hingga kini total mencapai 150an cabang store yang tersebar dari pulau terluar Natuna hingga pulau terujung Buru Maluku bahkan hingga ke Negara Timor Leste.",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),textAlign: TextAlign.justify,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
