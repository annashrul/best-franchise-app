import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/brand/productBrandController.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';



class ProdukBrandComponent extends StatefulWidget {
  @override
  _ProdukBrandComponentState createState() => _ProdukBrandComponentState();
}

class _ProdukBrandComponentState extends State<ProdukBrandComponent> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final brand=Provider.of<ProductBrandController>(context,listen: false);
    brand.loadProductBrand(context: context);

  }



  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    final productBrand = Provider.of<ProductBrandController>(context);
    if(productBrand.isLoading) {
      return ProductBrandLoading();
    }

    return new StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      padding: scale.getPadding(1,2),
      itemBuilder: (context,index){
        final val = productBrand.productBrandModel.data[index];
        return Card(
          margin:scale.getMarginLTRB(0,0,0,0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // elevation: 0.5,
          child: InTouchWidget(
              radius: 10,
              callback: (){

              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(val.photo),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    Padding(
                      padding: scale.getPadding(1,2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(val.title,style: Theme.of(context).textTheme.headline2),
                          Text(val.caption,style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
                          Text("Harga : Tergantung Lokasi",style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.w600),),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        );
      },
      itemCount: productBrand.productBrandModel.data.length,
    );
  }
}

