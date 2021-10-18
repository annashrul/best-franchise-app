import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProdukBrandComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return new StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      padding: scale.getPadding(1,2),
      itemBuilder: (context,index){
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
                      child: Image.network("https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyJTIwcG5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    Padding(
                      padding: scale.getPadding(1,2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CHOCOLATE HOT OREO",style: Theme.of(context).textTheme.headline2),
                          Text("Perpaduan antara cokelat dan oreo dicampur dengan ice cream..",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
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
      itemCount: 10,
    );


  }
}
