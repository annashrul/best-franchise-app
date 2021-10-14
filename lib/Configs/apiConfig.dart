class ApiConfig{
  static const String siteName = "Best Franchise";
  static const String onesignalAppId = "6061f1f8-ddd7-4ce5-beb0-891dcd16a6bd";
  static const String url = "http://ptnetindo.com:6706/";
  static const int timeOut = 60;
  static const String xProjectId = "296cd1b03960e8c8176fe06464c58ab8";
  static const String xRequestedFrom = "apps";
  static Map<String, String> head={
    'X-Project-ID': xProjectId,
    'X-Requested-From': xRequestedFrom,
    'Authorization':''
  };

}