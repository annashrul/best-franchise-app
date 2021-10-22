class StatusOrder{
  static int menungguVerifikasi=0;
  static int menungguPembayaran=1;
  static int prosesPengerjaan=2;
  static int opening=3;
  static int closing=4;

  static checkStatusOrder(int status){
    if(status==menungguVerifikasi)return "Menunggu Verfikasi";
    if(status==menungguPembayaran)return "Menunggu Pembayaran";
    if(status==prosesPengerjaan)return "Proses Pengerjaan";
    if(status==opening)return "Opening";
    if(status==closing)return "Closing";
  }
}
