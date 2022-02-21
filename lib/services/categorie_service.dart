import 'dart:convert';
import 'package:ap4_askhim/models/homeRecentService.dart';
import 'package:ap4_askhim/models/categorieServicePage.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class CategorieService extends BaseService {
  static Future<List<CategorieServicePage?>?>? getServiceByCat(
      String idCat) async {
    List<CategorieServicePage> serviceByCat = [];
    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/get-services-from-type/' + idCat,
        method: 'GET');
    if (response!.statusCode == 200) {
      var jsonList = json.decode(response.body);
      for (var service in jsonList) {
        serviceByCat.add(CategorieServicePage.fromJson(service));
      }
      return serviceByCat;
    } else {
      throw Exception('Erreur');
    }
  }
}
