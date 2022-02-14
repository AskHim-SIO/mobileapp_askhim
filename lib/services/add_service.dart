import 'dart:convert';
import 'package:ap4_askhim/models/add_models/getAdresseDetail.dart';
import 'package:ap4_askhim/models/add_models/transport_add.dart';
import 'package:ap4_askhim/models/adresse.dart';
import 'package:hive/hive.dart';
import 'package:ap4_askhim/model/token_models.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class AddService extends BaseService {
  static Future<Adresse> getAdressesByQuery(String? query) async {
    http.Response? response = await BaseService.makeRequest(
        'https://api-adresse.data.gouv.fr/search/?q=' + query! + '&limit=5',
        method: 'GET');
    if (response!.statusCode == 200) {
      var jsonList = response.body;

      return adresseFromJson(jsonList);
    } else {
      throw Exception('Erreur');
    }
  }

  static Future<bool> insertTransport(
      String dateEnd,
      String dateStart,
      String description,
      String adresseComplete,
      String motif,
      String name,
      int nbPlaceDispo,
      String pointArriver,
      String pointDepart,
      int price,
      String vehiculePerso) async {
    final adresse = await getAdressesByQuery(adresseComplete);
    print(adresse);
    var box = await Hive.openBox('tokenBox');
    var u = box.get('Token');
    var token = u.token;
    var payload = json.encode({
      'dateEnd': dateEnd,
      'dateStart': dateStart,
      'description': description,
      'lieuAdresse': adresse.features[0].properties.name,
      'lieuCodePostal': adresse.features[0].properties.citycode,
      'lieuVille': adresse.features[0].properties.city,
      'motif': motif,
      'name': name,
      'nbPlaceDispo': nbPlaceDispo,
      'pointArriver': pointArriver,
      'pointDepart': pointDepart,
      'price': price,
      'userToken': token,
      'vehiculePerso': vehiculePerso
    });

    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/create-transport-service',
        method: 'POST',
        body: payload);

    if (response!.statusCode == 201 || response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      throw Exception('Erreur');
    }
  }
}
