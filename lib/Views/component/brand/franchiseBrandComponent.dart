import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Controllers/brand/franchiseController.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';


class FranchiseBrandComponent extends StatefulWidget {
  final String idBrand;
  FranchiseBrandComponent({this.idBrand});
  @override
  _FranchiseBrandComponentState createState() => _FranchiseBrandComponentState();
}

class _FranchiseBrandComponentState extends State<FranchiseBrandComponent> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final franchise=Provider.of<FranchiseController>(context,listen: false);
    franchise.loadFranchise(context: context,idBrand: widget.idBrand);
  }
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    final franchise=Provider.of<FranchiseController>(context);

    return ListView.separated(
      padding: scale.getPadding(1,2),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context,index){
          if(franchise.isLoading){
            return BaseLoading(height: 10, width: 100,radius: 10);
          }
          final val = franchise.franchiseModel.data[index];
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
                  padding: scale.getPadding(2,1),
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
                      Text(val.title,style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),),
                      Container(
                        width: scale.getWidth(20),
                        child: Divider(color: ColorConfig.greyPrimary,height: scale.getHeight(0.5),thickness: 2),
                      ),
                      Text(val.price,style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
                      Text("Kontrak : ${val.contract} Tahun",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
                      Text("Booking Fee : ${val.bookingFee}%",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
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
                            itemCount: val.detail.length,
                            itemBuilder: (context,index){
                              final row=val.detail[index];
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.check_circle_outline,size: scale.getTextSize(11),color: ColorConfig.greenPrimary.withOpacity(0.7),),
                                  SizedBox(width: scale.getWidth(1),),
                                  Expanded(
                                    child: Text(row.title,style:Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary )),
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
        itemCount: franchise.isLoading?10:franchise.franchiseModel.data.length
    );
  }
}
