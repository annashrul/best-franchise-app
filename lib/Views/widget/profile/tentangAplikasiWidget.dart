import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/general/generalController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class TentangAplikasiWidget extends StatefulWidget {
  @override
  _TentangAplikasiWidgetState createState() => _TentangAplikasiWidgetState();
}

class _TentangAplikasiWidgetState extends State<TentangAplikasiWidget> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data=Provider.of<GeneralController>(context,listen: false);
    data.loadTentangAplikasi(context: context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final res=Provider.of<GeneralController>(context);
    final user = Provider.of<UserController>(context);
    var reff = user.dataUser[UserTable.referral];

    List data=[
      {"title":"Total Brand","color":"#FFE7E7","total":"+ ${res.isLoadingTentangAplikasi?"0":GeneralHelper().formatter.format(int.parse(res.tentangAplikasiModel.data.totalBrand))}"},
      {"title":"Total Franchise","color":"#F4CBEB","total":"+ ${res.isLoadingTentangAplikasi?"0":GeneralHelper().formatter.format(int.parse(res.tentangAplikasiModel.data.totalFranchise))}"},
      {"title":"Rata-Rata BEP","color":"#C3FBD0","total":"${res.isLoadingTentangAplikasi?"0":GeneralHelper().formatter.format(int.parse(res.tentangAplikasiModel.data.bep))}"},
      {"title":"Penghargaan","color":"#AAE7F4","total":"+ ${res.isLoadingTentangAplikasi?"0":GeneralHelper().formatter.format(int.parse(res.tentangAplikasiModel.data.totalPenghargaan))}"},
    ];
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
        context: context,
        title: "Tentang Kami",
        actions: [
          IconButton(onPressed: (){
            Share.share("Hai Sahabat BEST Franchise, ayo bergabung bersama kami dengan memasukan kode $reff");
          }, icon: BackgroundIconComponent(child: Icon(FontAwesome5Solid.share)))
        ]
      ),
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              res.isLoadingTentangAplikasi?BaseLoading(height: 20, width: 100):Image.network(res.tentangAplikasiModel.data.cover,height: scale.getHeight(20),width: double.infinity,fit: BoxFit.cover,),
              Container(
                margin: scale.getMarginLTRB(0,13,0,0),
                child: Column(
                  children: [
                    Image.asset(
                      StringConfig.imgLocal + "logo.png",
                      scale: 1.5,
                    ),
                    SizedBox(height: scale.getHeight(1),),
                    Container(
                      padding: scale.getPadding(0, 2),
                      child: res.isLoadingTentangAplikasi?BaseLoadingLoop(
                        child: BaseLoading(height: 1, width: 100),
                      ):Text(
                        res.tentangAplikasiModel.data.caption!=null?res.tentangAplikasiModel.data.caption:"Kami adalah perusahaan franchise dari tahun 2009 di bawah naungan PT. BEST FRANCHISE INDONESIA. Banyak Brand / Merk dagang yang sudah kami ciptakan dan sebagian besar sudah terdapat outlet yang kami buka bekerjasama dengan para franchise di seluruh Indonesia. Pengelolaan sistem yang terintegerasi membuat kami dapat bertahan dan dapat bersaing dengan perusahaanlainnya.",
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: scale.getHeight(1)),
          StaggeredGridView.countBuilder(
            padding: scale.getPadding(0,2),
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 2,
            itemCount:  data.length,
            itemBuilder: (BuildContext context, int index) {
              if(res.isLoadingTentangAplikasi)return BaseLoading(height: 10, width: 100);
              return Container(
                padding: scale.getPadding(1,2),
                decoration: BoxDecoration(
                    color: HexColor(data[index]["color"]),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[index]['title'],style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: Theme.of(context).textTheme.headline2.fontWeight),),
                    SizedBox(height: scale.getHeight(1),),
                    Align(
                      alignment: Alignment.bottomRight,
                      child:  Text(data[index]["total"],style: Theme.of(context).textTheme.headline1),
                    )
                  ],
                ),
              );
            },
            staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 10.0,
          ),

          Padding(
            padding: scale.getPadding(1,2),
            child: res.isLoadingTentangAplikasi?BaseLoading(height: 3, width:100):Container(
              padding: scale.getPadding(1,2),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(StringConfig.imgLocal+"bgTentangKami.png")
                  )
              ),
              child: Text(res.tentangAplikasiModel.data.tag!=null?res.tentangAplikasiModel.data.tag:"Benefit bergabung dengan kami",style: Theme.of(context).textTheme.headline2,),
            ),
          ),
          Padding(
            padding: scale.getPadding(1,2),
            child: res.isLoadingTentangAplikasi?BaseLoadingLoop(
              child: BaseLoading(height: 1, width: 100),
            ):Text(res.tentangAplikasiModel.data.tagCaption!=null?res.tentangAplikasiModel.data.tagCaption:"Pilihan Brand dan Jenis Usaha yang variatif mulai dari sandang ,papan dan pangan. \nKami mempunyai orang-orang ahli dibidangnya, sehingga penerapan persiapan dan operasional lebih mudah dan tepat serta efisien dan profesional.\nKami mempunyai orang-orang ahli dibidangnya, sehingga penerapan persiapan dan operasional lebih mudah dan tepat serta efisien dan profesional",style: Theme.of(context).textTheme.headline3,),
          )


        ],
      ),
    );
  }
}
