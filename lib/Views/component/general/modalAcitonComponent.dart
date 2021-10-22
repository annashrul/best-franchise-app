import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ModalActionComponent extends StatefulWidget {
  final List data;
  ModalActionComponent({this.data});
  @override
  _ModalActionComponentState createState() => _ModalActionComponentState();
}

class _ModalActionComponentState extends State<ModalActionComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Padding(
      padding: scale.getPadding(1,2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GeneralHelper.headerModal(context: context,title: "Pilih opsi"),
          SizedBox(height: scale.getHeight(2)),
          ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context,index){
                return InTouchWidget(
                    callback:widget.data[index]["action"],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.data[index]["title"],style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary)),
                        Icon(Icons.arrow_right)
                      ],
                    )
                );
              },
              separatorBuilder: (context,index){return Divider();},
              itemCount: 2
          )
        ],
      ),
    );
  }

}
