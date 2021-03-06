import 'dart:convert';
import 'package:ap4_askhim/models/getUserById.dart';
import 'package:ap4_askhim/models/serviceByUser.dart';
import 'package:ap4_askhim/models/updateUser.dart';
import 'package:ap4_askhim/models/userInfo.dart';
import 'package:hive/hive.dart';
import 'package:ap4_askhim/model/token_models.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class ProfileService extends BaseService {
  static Future<Map<String, dynamic>?> getUserInfo() async {
    var box = await Hive.openBox('tokenBox');
    if (box.get('Token') != null) {
      var u = box.get('Token');
      var token = u.token;
      http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/user/get-user-by-token/' + token,
        method: 'GET',
      );
      if (response!.statusCode == 200) {
        Map<String, dynamic> data =
            new Map<String, dynamic>.from(json.decode(response.body));
        return data;
      } else if (response.statusCode == 404) {
        Hive.box('tokenBox').clear();
      }
    } else {
      Hive.box('tokenBox').clear();
    }
  }

  static Future<Map<String, dynamic>?> getUserInfoById(int id) async {
    http.Response? response = await BaseService.makeRequest(
      BaseService.baseUri + '/user/get-user-by-id/' + id.toString(),
      method: 'GET',
    );
    if (response!.statusCode == 200) {
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
      return data;
    }
  }

  static Future<List<ServiceByUser?>?> getServicesByUser() async {
    var box = await Hive.openBox('tokenBox');
    if (box.get('Token') != null) {
      var u = box.get('Token');
      var token = u.token;
      List<ServiceByUser> recentServices = [];
      http.Response? response = await BaseService.makeRequest(
          BaseService.baseUri +
              '/service/get-services-from-user-by-token/' +
              token,
          method: 'GET');
      if (response!.statusCode == 200) {
        var jsonList = json.decode(response.body);
        for (var service in jsonList) {
          recentServices.add(ServiceByUser.fromJson(service));
        }
        return recentServices;
      } else if (response.statusCode == 404) {
        Hive.box('tokenBox').clear();
      }
    } else {
      Hive.box('tokenBox').clear();
    }
  }

  static Future<List<ServiceByUser?>?> getServicesByUserById(int id) async {
    List<ServiceByUser> recentServices = [];
    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri +
            '/service/get-services-from-user-by-id/' +
            id.toString(),
        method: 'GET');
    if (response!.statusCode == 200) {
      var jsonList = json.decode(response.body);
      for (var service in jsonList) {
        recentServices.add(ServiceByUser.fromJson(service));
      }
      return recentServices;
    }
  }

  static Future<Map<String, dynamic>?> getServiceById(int id) async {
    http.Response? response = await BaseService.makeRequest(
      BaseService.baseUri + '/service/get-service/' + id.toString(),
      method: 'GET',
    );
    if (response!.statusCode == 200) {
      Map<String, dynamic> data =
          Map<String, dynamic>.from(json.decode(response.body));
      return data;
    }
  }

  static Future<bool> tokenValid(String token) async {
    http.Response? response = await BaseService.makeRequest(
      BaseService.baseUri + '/auth/token-valid?request=' + token,
      method: 'GET',
    );
    if (response!.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateUser(
      String adresse,
      bool? admin,
      int? credit,
      String dateNaiss,
      String email,
      String firstName,
      int? id,
      String name,
      String? profilPicture,
      int tel) async {
    var infoUser = await getUserInfo();
    print(infoUser!["id"]);
    var box = await Hive.openBox('tokenBox');
    var payload = json.encode({
      'address': adresse,
      'admin': infoUser["admin"],
      'credit': infoUser["credit"],
      'dateNaiss': dateNaiss,
      'email': email,
      'firstname': firstName,
      'id': infoUser["id"],
      'name': name,
      'profilPicture': infoUser["profilPicture"],
      'tel': tel,
    });
    if (box.get('Token') != null) {
      var u = box.get('Token');
      var token = u.token;
      List<UpdateUser> updateUser = [];
      http.Response? response = await BaseService.makeRequest(
          BaseService.baseUri + '/user/update-user/' + token,
          method: 'PUT',
          body: payload);
      print(response!.body);
      if (response.statusCode == 202) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
