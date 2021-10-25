import 'dart:io';

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/brand/detailBrandController.dart';
import 'package:bestfranchise/Controllers/brand/favoriteBrandController.dart';
import 'package:bestfranchise/Controllers/brand/franchiseController.dart';
import 'package:bestfranchise/Controllers/brand/productBrandController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/brand/franchiseBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/lokasiBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/produkBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/reviewBrandComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/stickyHeaderComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBrandWidget extends StatefulWidget {
  final Map<dynamic, dynamic> obj;
  DetailBrandWidget({this.obj});

  @override
  _DetailBrandWidgetState createState() => _DetailBrandWidgetState();
}

class _DetailBrandWidgetState extends State<DetailBrandWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController controllerProduct;
  void scrollListener() {
    final brand = Provider.of<ProductBrandController>(context, listen: false);
    if (!brand.isLoading) {
      if (controllerProduct.position.pixels == controllerProduct.position.maxScrollExtent) {
        brand.loadMoreProductBrand(context);
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final detail=Provider.of<DetailBrandController>(context,listen: false);
    detail.loadDetailBrand(context: context,id: widget.obj["id"]);
    controllerProduct = new ScrollController()..addListener(scrollListener);

  }

  @override
  void dispose() {
    super.dispose();
    // final product=Provider.of<ProductBrandController>(context,listen: false);
    // final franchise=Provider.of<FranchiseController>(context,listen: false);
    // product.controller.removeListener(product.scrollListener);
    // franchise.controller = franchise.controller.removeListener(franchise.scrollListener);
    // franchise.controller = new ScrollController()..removeListener(franchise.scrollListener);
    controllerProduct.removeListener(scrollListener);

  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final brand = Provider.of<DetailBrandController>(context);
    final product = Provider.of<ProductBrandController>(context);
    final franchise = Provider.of<FranchiseController>(context);
    final favoirte = Provider.of<FavoriteBrandController>(context);
    Widget child;
    if (brand.indexTabActive == 0) {
      child = ProdukBrandComponent(idBrand: widget.obj["id"]);
    } else if (brand.indexTabActive == 1) {
      child = FranchiseBrandComponent(idBrand: widget.obj["id"]);
    } else if (brand.indexTabActive == 2) {
      child = LokasiBrandComponent(idBrand: widget.obj["id"]);
    } else {
      child = ReviewBrandComponent(idBrand: widget.obj["id"]);
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: GeneralHelper.appBarGeneral(
          context: context,
          title: "Detail Brand",
          actions: [
            InTouchWidget(
              callback: () async {
                await favoirte.create(
                    context: context, data: {"id_brand": widget.obj["id"]});
              },
              child: Container(
                alignment: Alignment.center,
                padding: scale.getPadding(1, 2),
                child: Image.asset(StringConfig.imgLocal + "brandFavorite.png"),
              ),
            ),
            InTouchWidget(
              callback: () async {},
              child: Container(
                alignment: Alignment.center,
                padding: scale.getPadding(1, 2),
                child: Image.asset(StringConfig.imgLocal + "whatsApp.png"),
              ),
            ),
          ]),
      floatingActionButton: Container(
        padding: scale.getPadding(1, 2),
        child: ButtonComponent(
          label: "Bergabung sekarang?",
          labelColor: Colors.white,
          backgroundColor: ColorConfig.redPrimary,
          callback: () => Navigator.of(context).pushNamed(RoutePath.joinWidget,
              arguments: {"id": widget.obj["id"]}),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: scale.getPaddingLTRB(0,0,0,5),
        controller:controllerProduct,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              brand.isLoading
                  ? BaseLoading(height: 20, width: 100)
                  : Image.asset(StringConfig.imgLocal + "detailBrand.png"),
              brand.isLoading
                  ? BaseLoading(
                      height: 5,
                      width: 12,
                      radius: 100,
                    )
                  : CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage(StringConfig.imgLocal + "burhot.png"),
                    )
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
              content: child
          ),
          SizedBox(height: scale.getHeight(1),),
          product.isLoadMore?CupertinoActivityIndicator():SizedBox(),
          SizedBox(height: scale.getHeight(1),),
        ],
      ),
    );
  }
}

void launchWhatsApp({
  @required int phone,
  @required String message,
}) async {
  String url() {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
    }
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}
