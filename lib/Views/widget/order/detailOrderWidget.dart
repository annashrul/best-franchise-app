import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/history/progressController.dart';
import 'package:bestfranchise/Controllers/history/statusOrderController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DetailOrderWidget extends StatefulWidget {
  final dynamic obj;
  DetailOrderWidget({this.obj});
  @override
  _DetailOrderWidgetState createState() => _DetailOrderWidgetState();
}

class _DetailOrderWidgetState extends State<DetailOrderWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final progress = Provider.of<ProgressController>(context,listen: false);
    progress.loadData(context: context,idOrder: widget.obj["id"]);

  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final detail = Provider.of<StatusOrderController>(context);
    final progress = Provider.of<ProgressController>(context);
    final valDetail=detail.statusOrderModel.data[detail.indexDetailOrder];
    double percentageGlobal=0;
    if(!progress.isLoading){
      if(progress.progressModel!=null){
        for(int i=0;i<progress.progressModel.data.length;i++){
          percentageGlobal+=double.parse(progress.progressModel.data[i].percentage);
        }
        percentageGlobal = percentageGlobal/progress.progressModel.data.length;
      }
    }

    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
        context: context,
        title: "Progress"
      ),
      body: SingleChildScrollView(
        padding: scale.getPadding(1,2),
        child: Column(
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
                        textSpaceBetween("Kode Order", valDetail.invoiceNo),
                        textSpaceBetween("Nama Pemilik", valDetail.owner),
                        textSpaceBetween("Tipe Investasi",valDetail.typeInvest),
                        textSpaceBetween("Tanggal Order", DateFormat("yyyy-MM-dd").format(valDetail.createdAt)),
                        textSpaceBetween("Estimasi Opening",valDetail.estOpening==null?"-":DateFormat("yyyy-MM-dd").format(valDetail.estOpening)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: scale.getHeight(1),),
            if(percentageGlobal>0)Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                elevation: 1,
                margin: EdgeInsets.zero,
                child: new LinearPercentIndicator(
                  padding: scale.getPadding(0,3),
                  center: Text(
                    "$percentageGlobal %",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  width:385.0,
                  lineHeight: 40,
                  percent:percentageGlobal/100,
                  backgroundColor: Colors.white,
                  progressColor: Color(0xFFFF7E7E),
                ),
              ),
            ),
            progress.isLoading?BaseLoadingLoop(
              child: LoadingCardImageTitleSubTitle(),
            ):progress.progressModel==null?NoDataComponent():ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  final val = progress.progressModel.data[index];
                  return InTouchWidget(
                    radius: 15,
                    callback: (){},
                    child: Padding(
                      padding: scale.getPadding(1,0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius:30 ,
                            backgroundImage: NetworkImage(val.photo),
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
                                      Text(val.content,style: Theme.of(context).textTheme.headline2),
                                      Text(val.caption,style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
                                    ],
                                  ),
                                ),
                                new CircularPercentIndicator(
                                  radius: 60.0,
                                  lineWidth: 10.0,
                                  percent: double.parse(val.percentage)/100,
                                  backgroundWidth: 1,
                                  center: new Text("${val.percentage}%",style: Theme.of(context).textTheme.headline2,),
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
                itemCount: progress.progressModel.data.length
            )
          ],
        ),
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
