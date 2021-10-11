import 'package:bestfranchise/Helpers/touchEffectHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SliderHomeComponent extends StatefulWidget {
  final List data;
  SliderHomeComponent({this.data});

  @override
  _SliderHomeComponentState createState() => _SliderHomeComponentState();
}

class _SliderHomeComponentState extends State<SliderHomeComponent>  with SingleTickerProviderStateMixin{
  int _current = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            viewportFraction: 1.0,
            height: scale.getHeight(21),
            onPageChanged: (index,reason) {
              setState(() {
                _current=index;
              });
            },
          ),
          items: widget.data.map((slide){
            return Container(
              margin: scale.getMarginLTRB(0,0,0,0),
              height: scale.getHeight(25),
              child: InTouchWidget(
                  callback: (){
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(slide["image"]), fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.2), offset: Offset(0, 4), blurRadius: 9)
                      ],
                    ),
                  )
              ),
            );
          }).toList(),
        ),

        Positioned(
          bottom: 25,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: widget.data.map((slide) {
              return Container(
                width: 20.0,
                height: 3.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: _current ==  widget.data.indexOf(slide)
                        ? Theme.of(context).hintColor
                        : Theme.of(context).hintColor.withOpacity(0.3)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

}
