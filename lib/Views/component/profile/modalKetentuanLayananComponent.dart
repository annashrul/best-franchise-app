import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/site/companyController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class ModalKetentuanLayananComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    final data = Provider.of<CompanyController>(context);
    return Container(
      height: scale.getHeight(70),
      padding: scale.getPadding(1, 2),
      child: Column(
        children: [
          GeneralHelper.headerModal(
              context: context, title: "Ketentuan Layanan"),
          SizedBox(
            height: scale.getHeight(1),
          ),
          Expanded(
              child: ListView(
            children: [
              Text(
                data.companyModel.data.tos,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.justify,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
