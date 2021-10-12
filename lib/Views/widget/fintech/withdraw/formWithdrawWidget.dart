import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/fintech/withdrawController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/bank/modalBankComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardHeaderReward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class FormWithdrawWidget extends StatefulWidget {
  @override
  _FormWithdrawWidgetState createState() => _FormWithdrawWidgetState();
}

class _FormWithdrawWidgetState extends State<FormWithdrawWidget> {



  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final wd = Provider.of<WithdrawController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
        context: context,
        title: "Withdraw",
        actions: [
          InkResponse(
            onTap: ()=>Navigator.of(context).pushNamed(RoutePath.historyWithdrawWidget),
            child: Image.asset(StringConfig.imgLocal+"historyWithdraw.png"),
          )
        ]
      ),
      body: ListView(
        padding: scale.getPadding(1,2),
        children: [
          CardHeaderReward(
            img: "royaltiBlack",
            title: "Dana Kamu",
            reward: "5,000,000",
            desc:"Saldo di atas adalah penggabungan antara komisi dan royalti saat ini.",
          ),
          SizedBox(height: scale.getHeight(2)),
          FieldComponent(
            controller: wd.noRekeningController,
            labelText: "No Rekening",
          ),
          SizedBox(height: scale.getHeight(1)),
          FieldComponent(
            controller: wd.atasNameController,
            labelText: "Atas Nama",
          ),
          SizedBox(height: scale.getHeight(1)),
          FieldComponent(
            controller: wd.bankController,
            labelText: "Pilih Bank",
            onTap: (){
              GeneralHelper.modal(
                context: context,
                child: ModalBankComponent()
              );
            },
          ),
          SizedBox(height: scale.getHeight(2)),
          Divider(),
          Text("Informasi : Dana yang kamu tarik adalah keseluruhan",style: Theme.of(context).textTheme.headline2,)
        ],
      ),
      bottomNavigationBar: Container(
        padding: scale.getPadding(1,2),
        child: ButtonComponent(
          label: "Proses",
          labelColor: Colors.white,
          backgroundColor: ColorConfig.redPrimary,
          callback: ()=>wd.store(),
        ),
      ),
    );
  }
}
