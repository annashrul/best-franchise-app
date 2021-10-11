class ApiConfig{
  static const String siteName = "Best Franchise";
  static const String onesignalAppId = "ad1a7344-2b2f-40d0-87c8-0f8ec150cb8f";
  static const String url = "https://api.adscoin.id/";
  static const int timeOut = 60;
  static const String xProjectId = "8123268367ea27e094e71e290";
  static const String xRequestedFrom = "apps";
  static Map<String, String> head={
    'X-Project-ID': xProjectId,
    'X-Requested-From': xRequestedFrom,
    'Authorization':''
  };

}