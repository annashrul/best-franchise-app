import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bestfranchise/Configs/apiConfig.dart';
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
      final response = await client.get(ApiConfig.url+url, headers:ApiConfig.head).timeout(Duration(seconds: ApiConfig.timeOut));
      print("################################ URL = $url, STATUS = ${response.statusCode}");
      if (response.statusCode == 200){
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      }
      else if(response.statusCode==500){
        GeneralHelper.toast(msg: "terjadi kesalahan url");
        return null;
      }
      else{
        final jsonResponse = json.decode(response.body);
        return GeneralModel.fromJson(jsonResponse);
      }
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
