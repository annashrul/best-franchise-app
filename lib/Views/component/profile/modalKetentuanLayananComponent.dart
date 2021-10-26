import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ModalKetentuanLayananComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return Container(
      padding: scale.getPadding(1, 2),
      height: scale.getHeight(70),
      child: Column(
        children: [
          GeneralHelper.headerModal(context: context,title: "Katentuan Layanan"),
          SizedBox(height: scale.getHeight(1),),
          Expanded(
              child: ListView(
                children: [
                  Text("Kebijakan Privasi Adanya Kebijakan Privasi ini adalah komitmen nyata dari Tokopedia untuk menghargai dan melindungi setiap data atau informasi pribadi Pengguna situs www.tokopedia.com, situs-situs turunannya, serta aplikasi gawai Tokopedia (selanjutnya disebut sebagai Situs). Kebijakan Privasi ini (beserta syarat-syarat penggunaan dari situs Tokopedia sebagaimana tercantum dalam Syarat & Ketentuan dan informasi lain yang tercantum di Situs) menetapkan dasar atas perolehan, pengumpulan, pengolahan, penganalisisan, penampilan, pengiriman, pembukaan, penyimpanan, perubahan, penghapusan dan/atau segala bentuk pengelolaan yang terkait dengan data atau informasi yang mengidentifikasikan atau dapat digunakan untuk mengidentifikasi Pengguna yang Pengguna berikan kepada Tokopedia atau yang Tokopedia kumpulkan dari Pengguna maupun pihak ketiga (selanjutnya disebut sebagai Data Pribadi).Dengan mengklik “Daftar” (Register) atau pernyataan serupa yang tersedia di laman pendaftaran Situs, Pengguna menyatakan bahwa setiap Data Pribadi Pengguna merupakan data yang benar dan sah, Pengguna mengakui bahwa ia telah diberitahukan dan memahami ketentuan Kebijakan Privasi ini serta Pengguna memberikan persetujuan kepada Tokopedia untuk memperoleh, mengumpulkan, mengolah, menganalisis, menampilkan, mengirimkan, membuka, menyimpan, mengubah, menghapus, mengelola dan/atau mempergunakan data tersebut untuk tujuan sebagaimana tercantum dalam Kebijakan Privasi.",
                    style:  Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.justify,
                  ),
                  Text("Kebijakan Privasi Adanya Kebijakan Privasi ini adalah komitmen nyata dari Tokopedia untuk menghargai dan melindungi setiap data atau informasi pribadi Pengguna situs www.tokopedia.com, situs-situs turunannya, serta aplikasi gawai Tokopedia (selanjutnya disebut sebagai Situs). Kebijakan Privasi ini (beserta syarat-syarat penggunaan dari situs Tokopedia sebagaimana tercantum dalam Syarat & Ketentuan dan informasi lain yang tercantum di Situs) menetapkan dasar atas perolehan, pengumpulan, pengolahan, penganalisisan, penampilan, pengiriman, pembukaan, penyimpanan, perubahan, penghapusan dan/atau segala bentuk pengelolaan yang terkait dengan data atau informasi yang mengidentifikasikan atau dapat digunakan untuk mengidentifikasi Pengguna yang Pengguna berikan kepada Tokopedia atau yang Tokopedia kumpulkan dari Pengguna maupun pihak ketiga (selanjutnya disebut sebagai Data Pribadi).Dengan mengklik “Daftar” (Register) atau pernyataan serupa yang tersedia di laman pendaftaran Situs, Pengguna menyatakan bahwa setiap Data Pribadi Pengguna merupakan data yang benar dan sah, Pengguna mengakui bahwa ia telah diberitahukan dan memahami ketentuan Kebijakan Privasi ini serta Pengguna memberikan persetujuan kepada Tokopedia untuk memperoleh, mengumpulkan, mengolah, menganalisis, menampilkan, mengirimkan, membuka, menyimpan, mengubah, menghapus, mengelola dan/atau mempergunakan data tersebut untuk tujuan sebagaimana tercantum dalam Kebijakan Privasi.",
                    style:  Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.justify,
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
