import 'dart:io';

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/brand/detailBrandController.dart';
import 'package:bestfranchise/Controllers/brand/franchiseController.dart';
import 'package:bestfranchise/Controllers/brand/productBrandController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/brand/franchiseBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/lokasiBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/produkBrandComponent.dart';
import 'package:bestfranchise/Views/component/brand/reviewBrandComponent.dart';
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
  ScrollController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DetailBrandController detailBrandController;
  ProductBrandController productBrandController;
  FranchiseController franchiseController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailBrandController=Provider.of<DetailBrandController>(context,listen: false);
    productBrandController=Provider.of<ProductBrandController>(context,listen: false);
    franchiseController=Provider.of<FranchiseController>(context,listen: false);

    detailBrandController.loadDetailBrand(context: context,id: widget.obj["id"]);

    productBrandController.controller = new ScrollController()..addListener(productBrandController.scrollListener);
    franchiseController.controller = new ScrollController()..addListener(franchiseController.scrollListener);

  }
  @override
  void dispose() {
    super.dispose();
    // final product=Provider.of<ProductBrandController>(context,listen: false);
    // final franchise=Provider.of<FranchiseController>(context,listen: false);
    // product.controller.removeListener(product.scrollListener);
    // franchise.controller = franchise.controller.removeListener(franchise.scrollListener);
    // franchise.controller = new ScrollController()..removeListener(franchise.scrollListener);
    productBrandController.controller.removeListener(productBrandController.scrollListener);
    franchiseController.controller.removeListener(franchiseController.scrollListener);

  }

  @override
  Widget build(BuildContext context) {

    ScreenScaler scale = ScreenScaler()..init(context);
    final brand = Provider.of<DetailBrandController>(context);
    final product = Provider.of<ProductBrandController>(context);
    final franchise = Provider.of<FranchiseController>(context);
    Widget child;
    if (brand.indexTabActive == 0) {
      child = ProdukBrandComponent();
      controller = product.controller;
    } else if (brand.indexTabActive == 1) {
      child = FranchiseBrandComponent(idBrand: widget.obj["id"]);
      controller = franchise.controller;
    } else if (brand.indexTabActive == 2) {
      child = LokasiBrandComponent(idBrand: widget.obj["id"]);
    } else {
      child = ReviewBrandComponent(idBrand:  widget.obj["id"]);
    }

    return Scaffold(
      key: _scaffoldKey,
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
              // Navigator.of(context).pushNamed(RoutePath.joinWidget),
              launchWhatsApp(
                  phone: 6281214126685,
                  message: 'Permintaan Bergabung Bestfranchise'),
          child: Text(
            "Bergabung sekarang ?",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.white),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        // controller:controller,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              brand.isLoading?BaseLoading(height:20,width: 100):Image.asset(StringConfig.imgLocal + "detailBrand.png"),
              brand.isLoading?BaseLoading(height:5,width: 12,radius: 100,):CircleAvatar(
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
