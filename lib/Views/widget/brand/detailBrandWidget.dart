import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/brand/detailBrandController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/brand/franchiseBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/lokasiBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/produkBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/reviewBrandComponent.dart';
import 'package:bestfranchise/Views/component/general/stickyHeaderComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class DetailBrandWidget extends StatefulWidget {
  final Map<dynamic, dynamic> obj;
  DetailBrandWidget({this.obj});

  @override
  _DetailBrandWidgetState createState() => _DetailBrandWidgetState();
}

class _DetailBrandWidgetState extends State<DetailBrandWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final brand = Provider.of<DetailBrandController>(context);
    Widget child;
    if (brand.indexTabActive == 0) {
      child = ProdukBrandComponent();
    } else if (brand.indexTabActive == 1) {
      child = FranchiseBrandComponent();
    } else if (brand.indexTabActive == 2) {
      child = LokasiBrandComponent();
    } else {
      child = ReviewBrandComponent();
    }
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context,
          title: "Detail Brand",
          actions: [
            InTouchWidget(
              callback: () {},
              child: Container(
                alignment: Alignment.center,
                padding: scale.getPadding(1, 2),
                child: Image.asset(StringConfig.imgLocal + "brandFavorite.png"),
              ),
            ),
            InTouchWidget(
              callback: () {},
              child: Container(
                alignment: Alignment.center,
                padding: scale.getPadding(1, 2),
                child: Image.asset(StringConfig.imgLocal + "whatsApp.png"),
              ),
            ),
          ]),
      floatingActionButton: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          color: ColorConfig.redPrimary,
          onPressed: () =>
              Navigator.of(context).pushNamed(RoutePath.joinWidget),
          child: Text(
            "Bergabung sekarang ?",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.white),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(StringConfig.imgLocal + "detailBrand.png"),
              Image.asset(StringConfig.imgLocal + "burhot.png"),
            ],
          ),
          StickyHeader(
              header: StickyHeaderComponent(
                data: [
                  {"title": "Produk"},
                  {"title": "Franchise"},
                  {"title": "Lokasi"},
                  {"title": "Review"},
                ],
                callback: (index) {
                  brand.setIndexTabActive(index);
                },
                indexActive: brand.indexTabActive,
              ),
              content: child),
        ],
      ),
    );
  }
}
