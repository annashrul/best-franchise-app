import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';


class FranchiseBrandComponent extends StatefulWidget {
  @override
  _FranchiseBrandComponentState createState() => _FranchiseBrandComponentState();
}

class _FranchiseBrandComponentState extends State<FranchiseBrandComponent> {
  @override
  Widget build(BuildContext context) {
    List data = [
      "Renovasi, Dekorasi & Interior",
      "Bahan Baku Awal, Perlengkapan dan Peralatan",
      "Perlengkapan Kasir & User Apps",
      "Training, Promosi & Pendampingan"
    ];
    ScreenScaler scale = new ScreenScaler()..init(context);
    return ListView.separated(
      padding: scale.getPadding(1,2),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Card(
            color: Color(0xFFE5E5E5),
            margin:scale.getMarginLTRB(0,0,0,0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: scale.getPadding(1.5,1),
                  decoration: BoxDecoration(
                    color: ColorConfig.greenPrimary.withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Silver",style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),),
                      Container(
                        width: scale.getWidth(20),
                        child: Divider(color: ColorConfig.greyPrimary,height: scale.getHeight(0.5),thickness: 2),
                      ),
                      Text("Rp. 150.000.000",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
                      Text("Kontrak : 5 Tahun",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
                      Text("Booking Fee : 5%",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
                      Text("Royalti : 5 %/Bln",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
                    ],
                  ),
                ),
                SizedBox(width: scale.getWidth(2),),
                Expanded(
                  child: Padding(
                    padding: scale.getPadding(0.5,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fasilitas",style: Theme.of(context).textTheme.headline1),
                        SizedBox(height: scale.getHeight(0.5),),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context,index){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.check_circle_outline,size: scale.getTextSize(11),color: ColorConfig.greenPrimary.withOpacity(0.7),),
                                  SizedBox(width: scale.getWidth(1),),
                                  Expanded(
                                    child: Text(data[index],style:Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary )),
                                  )
                                ],
                              );
                            }
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context,index){return SizedBox(height: scale.getHeight(1),);},
        itemCount: 10
    );
  }
}
