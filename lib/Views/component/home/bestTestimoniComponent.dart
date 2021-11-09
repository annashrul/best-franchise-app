import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeTestiModel.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BestTestimoniComponent extends StatefulWidget {
  final List<Datum> valTs;
  BestTestimoniComponent(this.valTs);

  @override
  _BestTestimoniComponentState createState() => _BestTestimoniComponentState();
}

class _BestTestimoniComponentState extends State<BestTestimoniComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);

    return Container(
      margin: scale.getMarginLTRB(0, 0, 0, 0),
      height: scale.getHeight(20),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.valTs.length,
        itemBuilder: (context, index) {
          final val = widget.valTs[index];
          return InTouchWidget(
            radius: 10,
              callback: (){
                GeneralHelper.dialog(
                  context: context,
                    child: <Widget>[
                      ModalPreviewTestimoniComponent(data: widget.valTs,indexActive: index,)
                    ]
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 1),
                width: scale.getWidth(40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[200])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(val.photo),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                          val.rating,
                              (index) => Icon(
                            Icons.star,
                            size: scale.getTextSize(9),
                            color: Colors.yellow,
                          )),
                    ),
                    Container(
                      padding: scale.getPadding(0, 1),
                      child: Text(
                        val.caption,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: ColorConfig.greyPrimary),
                      ),
                    )
                  ],
                ),
              )
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: scale.getWidth(1));
        },
      ),
    );
  }
}




class ModalPreviewTestimoniComponent extends StatefulWidget {
  final List<Datum> data;
  final int indexActive;
  ModalPreviewTestimoniComponent({this.data,this.indexActive});
  @override
  _ModalPreviewTestimoniComponentState createState() => _ModalPreviewTestimoniComponentState();
}

class _ModalPreviewTestimoniComponentState extends State<ModalPreviewTestimoniComponent> {

  int index=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.indexActive;
  }


  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);

    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 1),
            decoration: BoxDecoration(
                color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(widget.data[index].photo),
                ),
                SizedBox(height: scale.getHeight(1),),
                Text(widget.data[index].title,style: Theme.of(context).textTheme.headline1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      widget.data[index].rating,
                          (index) => Icon(
                        Icons.star,
                        size: scale.getTextSize(9),
                        color: Colors.yellow,
                      )),
                ),
                Container(
                  padding: scale.getPadding(0, 1),
                  child: Text(
                    widget.data[index].caption,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: ColorConfig.greyPrimary),
                  ),
                ),
                SizedBox(height: scale.getHeight(2),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkResponse(
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,color: index==0?Colors.grey:Colors.black,size: scale.getTextSize(10)),
                          Text("Prev",style: Theme.of(context).textTheme.headline1.copyWith(color: index==0?Colors.grey:Colors.black)),
                        ],
                      ),
                      onTap: (){
                        if(index>0){
                          index--;
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(width: scale.getWidth(5)),
                    InkResponse(
                      child: Row(
                        children: [
                          Text("Next",style: Theme.of(context).textTheme.headline1.copyWith(color: index==widget.data.length-1?Colors.grey:Colors.black)),
                          Icon(Icons.arrow_forward_ios,color:index==widget.data.length-1?Colors.grey:Colors.black,size: scale.getTextSize(10),),
                        ],
                      ),
                      onTap: (){
                        if(index<widget.data.length-1){
                          index++;
                          setState(() {});
                        }
                        print("############### INDEX = $index");
                        print("############### DATA = ${widget.data.length}");

                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
