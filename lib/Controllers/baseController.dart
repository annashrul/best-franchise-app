import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bestfranchise/Configs/apiConfig.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/General/generalModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:provider/provider.dart';
// import 'package:http/http.dart' s http;


class BaseController{
  get({String url,BuildContext context})async{
    final res = isNotError(context: context,callback: (){});
    if(res){
      Client client = new Client();
      final userStorage = Provider.of<UserController>(context, listen: false);
      // print("############## ${userStorage.dataUser[UserTable.token]}");
      if(userStorage.dataUser!=null){
        if(userStorage.dataUser[UserTable.token]!=''){
          ApiConfig.head["Authorization"] = "Bearer ${userStorage.dataUser[UserTable.token]}";
        }
      }
       // print(ApiConfig.head)
      final response = await client.get(ApiConfig.url+url, headers:ApiConfig.head).timeout(Duration(seconds: ApiConfig.timeOut));
      print("################################ URL = $url, HEADER = ${ApiConfig.head} STATUS = ${response.statusCode}");
      if (response.statusCode == 200){
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      }
      else if(response.statusCode==500){
        GeneralHelper.toast(msg: "terjadi kesalahan url");
        return null;
      }
      else{
        GeneralHelper.toast(msg: "terjadi kesalahan url");
        return null;
      }
    }
  }
  post({String url,dynamic data,BuildContext context,Function callback}) async {
    try{
      GeneralHelper.loadingDialog(context);
      final userStorage = Provider.of<UserController>(context, listen: false);
      if(userStorage.dataUser!=null){
        if(userStorage.dataUser[UserTable.token]!=''){
          ApiConfig.head["Authorization"] = "Bearer ${userStorage.dataUser[UserTable.token]}";
        }
      }
      Client client = new Client();
      final response = await client.post( ApiConfig.url+url,headers:ApiConfig.head,body:data);
      print("=================== POST url = $url status code = ${response.statusCode}, body=$data ============================");
      if(response.statusCode==200){
        final jsonResponse =  json.decode(response.body);
        Navigator.pop(context);
        print(jsonResponse);
        if(jsonResponse["meta"]["status"]=="failed"){
          GeneralHelper.toast(msg:jsonResponse["meta"]["message"]);
          return null;
        }
        else{
          return jsonResponse;
        }
      }
      else{
        Navigator.pop(context);
        final jsonResponse = json.decode(response.body);
        print("jsonResponse = $jsonResponse");
        // GeneralModel result = GeneralModel.fromJson(jsonResponse);
        GeneralHelper.toast(msg: jsonResponse["meta"]["message"]);
        return null;
      }
    }on TimeoutException catch (e) {
      print("###################################### GET TimeoutException");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    } on SocketException catch (e) {
      print("###################################### GET SocketException");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    }
    on Error catch (e) {
      print("###################################### GET Error");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");

    }
  }
  delete({String url,BuildContext context}) async{
    try{
      GeneralHelper.loadingDialog(context);
      final userStorage = Provider.of<UserController>(context, listen: false);
      if(userStorage.dataUser!=null){
        if(userStorage.dataUser[UserTable.token]!=''){
          ApiConfig.head["Authorization"] = "Bearer ${userStorage.dataUser[UserTable.token]}";
        }
      }
      Client client = new Client();
      final response = await client.delete(ApiConfig.url+url,headers:ApiConfig.head).timeout(Duration(seconds: ApiConfig.timeOut));
      Navigator.of(context).pop();
      if(response.statusCode==200){
        final jsonResponse =  json.decode(response.body);
        Navigator.pop(context);
        if(jsonResponse["meta"]["status"]=="failed"){
          GeneralHelper.toast(msg:jsonResponse["meta"]["message"]);
          return null;
        }
        else{
          return jsonResponse;
        }
      }
      else{
        Navigator.pop(context);
        final jsonResponse = json.decode(response.body);
        print("jsonResponse = $jsonResponse");
        GeneralHelper.toast(msg: jsonResponse["meta"]["message"]);
        return null;
      }
    }on TimeoutException catch (e) {
      print("###################################### GET TimeoutException");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    } on SocketException catch (e) {
      print("###################################### GET SocketException");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    }
    on Error catch (e) {
      print("###################################### GET Error");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");

    }
  }


  isNotError({BuildContext context,Function callback}){
    try{
      return true;
    }on TimeoutException catch (e) {
      print("###################################### GET TimeoutException");
      return Navigator.pushNamed(context, "error",arguments: (){
        print("TimeoutException");
      });
    } on SocketException catch (e) {
      print("###################################### GET SocketException");
      return Navigator.pushNamed(context, "error",arguments: (){
        print("SocketException");
      });
    }
    on Error catch (e) {
      print("###################################### GET Error");
      return Navigator.pushNamed(context, "error",arguments: (){
        print("Error");
      });
    }
  }

}
