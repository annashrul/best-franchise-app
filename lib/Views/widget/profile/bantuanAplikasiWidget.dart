import 'package:bestfranchise/Controllers/faq/faqController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/searchComponent.dart';
import 'package:bestfranchise/Views/component/profile/bantuanAplikasi/contentBantuanAplikasiComponent.dart';
import 'package:bestfranchise/Views/component/profile/bantuanAplikasi/modalCategoryComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardHeaderReward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class BantuanApliaskiWidget extends StatefulWidget {
  @override
  _BantuanApliaskiWidgetState createState() => _BantuanApliaskiWidgetState();
}

class _BantuanApliaskiWidgetState extends State<BantuanApliaskiWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final faq = Provider.of<FaqController>(context, listen: false);
    faq.loadFaq(context: context);
    faq.loadFaqCat(context: context);
  }

  TextEditingController categoryController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final faq = Provider.of<FaqController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context, title: "Bantuan Aplikasi"),
      body: ListView(
        padding: scale.getPadding(2, 2),
        children: [
          CardHeaderReward(
            img: "tandaTanya",
            title: "Frequently Ask Question",
            desc: "Ada yang dapat kami bantu ?",
          ),
          SizedBox(height: scale.getHeight(1)),
          SearchComponent(hintText: "Cari topik yang ingin kamu tanyakan"),
          SizedBox(height: scale.getHeight(1)),
          faq.isLoadingCat
              ? BaseLoadingLoop(
                  child: LoadingCardImageTitleSubTitle(),
                )
              : faq.faqCatModel == null
                  ? NoDataComponent()
                  : FieldComponent(
                      controller: categoryController,
                      labelText: "Kategori",
                      onTap: () {
                        GeneralHelper.modal(
                            context: context,
                            child: ModalCategoryBantuanApliaskiComponent(
                                faq.faqCatModel));
                      },
                    ),
          SizedBox(height: scale.getHeight(1)),
          faq.isLoading
              ? BaseLoadingLoop(
                  child: LoadingCardImageTitleSubTitle(),
                )
              : faq.faqModel == null
                  ? NoDataComponent()
                  : ContentBantuanAplikasiComponent(faq.faqModel.data)
        ],
      ),
    );
  }
}
