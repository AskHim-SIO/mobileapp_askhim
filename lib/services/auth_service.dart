import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:ap4_askhim/model/token_models.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class AuthService extends BaseService {
  static Future<bool?> authenticate(String email, String password) async {
    var payload = json.encode({'email': email, 'password': password});
    print(payload);

    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/auth/login',
        method: 'POST',
        body: payload);

    if (response!.statusCode == 200 && response.body != '') {
      String tokenstring = response.body.toString();
      var box = await Hive.openBox('tokenBox');
      var token = TokenModel(token: tokenstring);
      box.add(token);
      await box.put("Token", TokenModel(token: tokenstring));
      var u = box.get('Token');
      print(u.token);
      return true;
    } else if (response.statusCode == 401) {
      return false;
    }
  }

  static Future<bool?> signUp(String dateNaiss, String email, String firstname,
      String name, String password) async {
    var payload = json.encode({
      'dateNaiss': dateNaiss,
      'email': email,
      'firstname': firstname,
      'name': name,
      'password': password
    });
    print(payload);
    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/user/create-user',
        method: 'POST',
        body: payload);
    print(response!.body);
    if (response.statusCode == 201) {
      return await authenticate(
          json.decode(payload)['email'], json.decode(payload)['password']);
    } else if (response.statusCode == 409) {
      return false;
    }
  }

  static clearAuth() async {
    Hive.box<TokenModel?>('userBox').put('User', null);
  }
}
