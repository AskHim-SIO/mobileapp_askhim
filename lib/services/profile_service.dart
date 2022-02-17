import 'dart:convert';
import 'package:ap4_askhim/models/serviceByUser.dart';
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
        BaseService.baseUri + '/user/get-user/' + token,
        method: 'GET',
      );
      print(response!.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            new Map<String, dynamic>.from(json.decode(response.body));
        return data;
      } else if (response.statusCode == 404) {
        Hive.box('tokenBox').clear();
        print('supprimé');
      }
    } else {
      Hive.box('tokenBox').clear();
      print('supprimé2');
    }
  }

  static Future<List<ServiceByUser?>?> getServicesByUser() async {
    var box = await Hive.openBox('tokenBox');
    if (box.get('Token') != null) {
      var u = box.get('Token');
      var token = u.token;
      List<ServiceByUser> recentServices = [];
      http.Response? response = await BaseService.makeRequest(
          BaseService.baseUri + '/service/get-services-from-user/' + token,
          method: 'GET');
      print(response!.body);
      if (response.statusCode == 200) {
        var jsonList = json.decode(response.body);
        for (var service in jsonList) {
          recentServices.add(ServiceByUser.fromJson(service));
        }
        return recentServices;
      } else if (response.statusCode == 404) {
        Hive.box('tokenBox').clear();
        print('supprimé');
      }
    } else {
      Hive.box('tokenBox').clear();
      print('supprimé2');
    }
  }

  static Future<bool> updateUser(String adresse, String dateNaiss, String email,
      String firstname, String name, int tel) async {
    var box = await Hive.openBox('tokenBox');
    if (box.get('Token') != null) {
      var u = box.get('Token');
      var token = u.token;
      var payload = json.encode({
        'adress': adresse,
        'dateNaiss': dateNaiss,
        'email': email,
        'firstname': firstname,
        'name': name,
        'tel': tel
      });
      http.Response? response = await BaseService.makeRequest(
          BaseService.baseUri + '/user/update-user/' + token,
          method: 'PUT',
          body: payload);

      print(response!.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
