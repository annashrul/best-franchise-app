import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/brand/franchiseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class ModalTipeInvestasiComponent extends StatefulWidget {
  final String idBrand;
  final void Function(dynamic data) callback;
  ModalTipeInvestasiComponent({this.idBrand,this.callback});
  @override
  _ModalTipeInvestasiComponentState createState() =>
      _ModalTipeInvestasiComponentState();
}

class _ModalTipeInvestasiComponentState extends State<ModalTipeInvestasiComponent> {

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

    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.75,
        expand: false,
        builder: (_, controller)=>Padding(
          padding: scale.getPadding(1,2),
          child: Column(
            children: [
              GeneralHelper.headerModal(context: context, title: "Pilih Tipe Investasi"),
              SizedBox(
                height: scale.getHeight(1),
              ),
              Expanded(
                child: ListView.separated(
                    controller: controller,
                    itemBuilder: (context, index) {
                      if(franchise.isLoading) return LoadingCardImageTitleSubTitle();
                      if(franchise.franchiseModel==null) return NoDataComponent();
                      return Card(
                        margin: scale.getMarginLTRB(0, 0, 0, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 0.5,
                        child: InTouchWidget(
                          radius: 15,
                          callback: () {
                            widget.callback(franchise.franchiseModel.data[index].toJson());
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: scale.getPadding(0.5, 2),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        franchise.franchiseModel.data[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2

                                    ),
                                    Text(
                                      GeneralHelper().formatter.format(int.parse(franchise.franchiseModel.data[index].price)),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                          color: ColorConfig.greyPrimary),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox();
                    },
                    itemCount: franchise.isLoading?10:franchise.franchiseModel==null?1:franchise.franchiseModel.data.length
                ),
              ),
            ],
          ),
        )
    );
  }
}
