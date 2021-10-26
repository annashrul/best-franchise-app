import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bestfranchise/Configs/apiConfig.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' s http;

class BaseController {
  get({String url, BuildContext context}) async {
    try {
      Client client = new Client();
      final userStorage = Provider.of<UserController>(context, listen: false);
      // print("############## ${userStorage.dataUser[UserTable.token]}");
      if (userStorage.dataUser != null) {
        if (userStorage.dataUser[UserTable.token] != '') {
          // ApiConfig.head["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiZWEyNDQ0ZC0zZDZiLTQyNGItYTQ3YS00OTBiY2I3NTYwYjgiLCJpYXQiOjE1NzEwNDI0OTEsImV4cCI6MTU3MzYzNDQ5MX0.lvRR9rU3cdLbJ9Gi0Ryucwl_7IMK6NF7BTblIQUDA9Q";
          ApiConfig.head["Authorization"] = "Bearer ${userStorage.dataUser[UserTable.token]}";

        }
      }

      final response = await client
          .get(ApiConfig.url + url, headers: ApiConfig.head)
          .timeout(Duration(seconds: ApiConfig.timeOut));
      print(
          "################################ URL = $url, HEADER = ${ApiConfig.head} STATUS = ${response.statusCode}");
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("################################ RESPONSE = $jsonResponse");
        return jsonResponse;
      } else if (response.statusCode == 500) {
        GeneralHelper.toast(msg: "terjadi kesalahan server");
        return null;
      } else {
        GeneralHelper.toast(msg: "terjadi kesalahan url");
        return null;
      }
    } on TimeoutException catch (e) {
      print(
          "###################################### GET TimeoutException ${e.message}");
      GeneralHelper.toast(msg: e.message);
      return null;
    } on SocketException catch (e) {
      print("###################################### GET SocketException");
      GeneralHelper.toast(msg: e.message);
      return null;
    } on Error catch (e) {
      print("###################################### GET Error");
      GeneralHelper.toast(msg: e.toString());
      return null;
    }
  }

  post(
      {String url,
      dynamic data,
      BuildContext context,
      Function callback}) async {
    try {
      GeneralHelper.loadingDialog(context);
      final userStorage = Provider.of<UserController>(context, listen: false);
      if (userStorage.dataUser != null) {
        if (userStorage.dataUser[UserTable.token] != '') {
          List<int> contentLength = utf8.encode(json.encode(data));
          // ApiConfig.head["Content-Type"] = 'multipart/form-data';
          ApiConfig.head["Access-Control-Allow-Origin"] = '*';
          ApiConfig.head["Authorization"] = "Bearer ${userStorage.dataUser[UserTable.token]}";
          ApiConfig.head["req.headers.contentLength"] = contentLength.length.toString();
          // ApiConfig.head["Accept"] = "*/*";
          // ApiConfig.head["content-type"] = 'application/json';
          // ApiConfig.head["Content-Type"]= 'application/json';
        }
      }
      Client client = new Client();
      final response = await client.post(ApiConfig.url + url,
          headers: ApiConfig.head, body: data);
      print(
          "=================== POST url = $url status code = ${response.statusCode},head=${ApiConfig.head} body=$data ============================");
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        Navigator.pop(context);
        print(jsonResponse);
        if (jsonResponse["meta"]["status"] == "failed") {
          GeneralHelper.toast(msg: jsonResponse["meta"]["message"]);
          return null;
        } else {
          return jsonResponse;
        }
      } else if (response.statusCode == 413) {
        Navigator.pop(context);
        GeneralHelper.toast(msg: "file terlalu besar");
        return null;
      } else {
        Navigator.pop(context);
        final jsonResponse = json.decode(response.body);
        print("jsonResponse = $jsonResponse");
        GeneralHelper.toast(msg: jsonResponse["meta"]["message"]);
        return null;
      }
    } on TimeoutException catch (e) {
      print("###################################### GET TimeoutException");
      GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
      return null;
    } on SocketException catch (e) {
      print("###################################### GET SocketException");
      GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
      return null;
    } on Error catch (e) {
      print("###################################### GET Error");
      Navigator.of(context).pop();
      GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
      return null;
    }
  }

  put(
      {String url,
      dynamic data,
      BuildContext context,
      Function callback}) async {
    try {
      GeneralHelper.loadingDialog(context);
      final userStorage = Provider.of<UserController>(context, listen: false);
      if (userStorage.dataUser != null) {
        if (userStorage.dataUser[UserTable.token] != '') {
          ApiConfig.head["Authorization"] =
              "Bearer ${userStorage.dataUser[UserTable.token]}";
          ApiConfig.head["HttpHeaders.contentTypeHeader"] = 'application/json';
        }
      }
      Client client = new Client();
      final response = await client.put(ApiConfig.url + url,
          headers: ApiConfig.head, body: data);
      print(
          "=================== POST url = $url status code = ${response.statusCode},head=${ApiConfig.head} body=$data ============================");
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        Navigator.pop(context);
        print(jsonResponse);
        if (jsonResponse["meta"]["status"] == "failed") {
          GeneralHelper.toast(msg: jsonResponse["meta"]["message"]);
          return null;
        } else {
          return jsonResponse;
        }
      } else {
        Navigator.pop(context);
        final jsonResponse = json.decode(response.body);
        print("jsonResponse = $jsonResponse");
        // GeneralModel result = GeneralModel.fromJson(jsonResponse);
        GeneralHelper.toast(msg: jsonResponse["meta"]["message"]);
        return null;
      }
    } on TimeoutException catch (e) {
      print("###################################### GET TimeoutException");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    } on SocketException catch (e) {
      print("###################################### GET SocketException");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    } on Error catch (e) {
      print("###################################### GET Error");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    }
  }

  delete({String url, BuildContext context}) async {
    try {
      GeneralHelper.loadingDialog(context);
      final userStorage = Provider.of<UserController>(context, listen: false);
      if (userStorage.dataUser != null) {
        if (userStorage.dataUser[UserTable.token] != '') {
          ApiConfig.head["Authorization"] =
              "Bearer ${userStorage.dataUser[UserTable.token]}";
        }
      }
      Client client = new Client();
      final response = await client
          .delete(ApiConfig.url + url, headers: ApiConfig.head)
          .timeout(Duration(seconds: ApiConfig.timeOut));
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        Navigator.pop(context);
        if (jsonResponse["meta"]["status"] == "failed") {
          GeneralHelper.toast(msg: jsonResponse["meta"]["message"]);
          return null;
        } else {
          return jsonResponse;
        }
      } else {
        Navigator.pop(context);
        final jsonResponse = json.decode(response.body);
        print("jsonResponse = $jsonResponse");
        GeneralHelper.toast(msg: jsonResponse["meta"]["message"]);
        return null;
      }
    } on TimeoutException catch (e) {
      print("###################################### GET TimeoutException");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    } on SocketException catch (e) {
      print("###################################### GET SocketException");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    } on Error catch (e) {
      print("###################################### GET Error");
      return GeneralHelper.toast(msg: "terjadi kesalahan koneksi");
    }
  }
}
