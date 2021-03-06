import 'dart:convert';
import 'package:ap4_askhim/models/homeRecentService.dart';
import 'package:ap4_askhim/models/categorieServicePage.dart';
import 'package:ap4_askhim/models/serviceDetails.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class serviceDetails extends BaseService {
  static Future<Map<String, dynamic>?> getServiceDetails(String idS) async {
    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/get-service/' + idS,
        method: 'GET');
    if (response!.statusCode == 200) {
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
      return data;
    } else {
      throw Exception('Erreur');
    }
  }
}
