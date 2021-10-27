class UserTable {
  static const String id = "id";
  static const String idUser = "idUser";
  static const String token = "token";
  static const String fullname = "fullname";
  static const String mobile_no = "mobile_no";
  static const String photo = "photo";
  static const String cover = "cover";
  static const String email = "email";
  static const String location = "location";
  static const String referral = "referral";
  static const String status = "status";
  static const String statusRoleApp = "statusRoleApp";

  static const String TABLE_NAME = "user";
  static const String CREATE_TABLE =
      " CREATE TABLE IF NOT EXISTS $TABLE_NAME ( id INTEGER PRIMARY KEY AUTOINCREMENT, $idUser TEXT,$token TEXT,$fullname TEXT, $mobile_no TEXT,$photo TEXT,$cover TEXT,$email TEXT,$referral TEXT,$status TEXT,$location TEXT,$statusRoleApp TEXT) ";
  static const String SELECT = "select * from $TABLE_NAME";
}
