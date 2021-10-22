import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Models/Faq/faqCatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ModalCategoryBantuanApliaskiComponent extends StatefulWidget {
  final FaqCatModel faqCatModel;
  ModalCategoryBantuanApliaskiComponent(this.faqCatModel);

  @override
  _ModalCategoryBantuanApliaskiComponentState createState() =>
      _ModalCategoryBantuanApliaskiComponentState();
}

class _ModalCategoryBantuanApliaskiComponentState
    extends State<ModalCategoryBantuanApliaskiComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.75,
        expand: false,
        builder: (_, controller) => Padding(
              padding: scale.getPadding(1, 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pilih Kategori",
                          style: Theme.of(context).textTheme.headline1),
                    ],
                  ),
                  SizedBox(
                    height: scale.getHeight(1),
                  ),
                  Expanded(
                    child: ListView.separated(
                        controller: controller,
                        itemBuilder: (context, index) {
                          final val = widget.faqCatModel.data[index];
                          return Text(
                            val.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: ColorConfig.greyPrimary,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .fontWeight),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: widget.faqCatModel.data.length),
                  ),
                ],
              ),
            ));
  }
}
