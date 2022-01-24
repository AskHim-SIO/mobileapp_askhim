import 'dart:convert';
import 'package:ap4_askhim/models/userInfo.dart';
import 'package:hive/hive.dart';
import 'package:ap4_askhim/model/token_models.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class ProfileService extends BaseService {
  static Future<Map<String, dynamic>> getUserInfo() async {
    var box = await Hive.openBox('tokenBox');
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
    } else {
      throw Exception('Erreur');
    }
  }
}
