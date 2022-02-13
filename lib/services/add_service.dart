import 'dart:convert';
import 'package:ap4_askhim/models/adresse.dart';
import 'package:hive/hive.dart';
import 'package:ap4_askhim/model/token_models.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class AddService extends BaseService {
  static Future<Adresse> getAdressesByQuery(String? query) async {
    List<Adresse> adresse = [];
    http.Response? response = await BaseService.makeRequest(
        'https://api-adresse.data.gouv.fr/search/?q=' + query! + '&limit=5',
        method: 'GET');
    print(response!.body);
    if (response.statusCode == 200) {
      var jsonList = response.body;

      return adresseFromJson(jsonList);
    } else {
      throw Exception('Erreur');
    }
  }
}
