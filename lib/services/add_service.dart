import 'dart:convert';
import 'package:ap4_askhim/models/adresse.dart';
import 'package:hive/hive.dart';
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

  static Future<String> insertTransport(
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
      return response.body;
    } else {
      throw Exception('Erreur');
    }
  }

  static Future<String> insertCourse(
    String dateEnd,
    String dateStart,
    String accompagnement,
    String description,
    String adresseComplete,
    String listeCourse,
    String typeLieu,
    String name,
    int price,
  ) async {
    final adresse = await getAdressesByQuery(adresseComplete);
    var box = await Hive.openBox('tokenBox');
    var u = box.get('Token');
    var token = u.token;
    var payload = json.encode({
      'accompagnement': accompagnement,
      'dateEnd': dateEnd,
      'dateStart': dateStart,
      'description': description,
      'lieuAdresse': adresse.features[0].properties.name,
      'lieuCodePostal': int.parse(adresse.features[0].properties.citycode),
      'lieuVille': adresse.features[0].properties.city,
      'listeCourse': listeCourse,
      'name': name,
      'price': price,
      'typeLieu': typeLieu,
      'userToken': token.toString(),
    });

    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/create-course-service',
        method: 'POST',
        body: payload);

    if (response!.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response);
    }
  }

  static Future<String> insertFormations(
    String competence,
    String dateEnd,
    String dateStart,
    String description,
    String adresseComplete,
    String materiel,
    String name,
    int nbHeure,
    String presence,
    int price,
  ) async {
    final adresse = await getAdressesByQuery(adresseComplete);
    var box = await Hive.openBox('tokenBox');
    var u = box.get('Token');
    var token = u.token;
    var payload = json.encode({
      'competence': competence,
      'dateEnd': dateEnd,
      'dateStart': dateStart,
      'description': description,
      'lieuAdresse': adresse.features[0].properties.name,
      'lieuCodePostal': int.parse(adresse.features[0].properties.citycode),
      'lieuVille': adresse.features[0].properties.city,
      'materiel': materiel,
      'name': name,
      'nbHeure': nbHeure,
      'presence': presence,
      'price': price,
      'userToken': token.toString(),
    });

    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/create-formation-service',
        method: 'POST',
        body: payload);

    if (response!.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response);
    }
  }

  static Future<String> insertLoisir(
    bool animal,
    String dateEnd,
    String dateStart,
    String description,
    String jeu,
    String adresseComplete,
    String name,
    int nbPersonne,
    int price,
  ) async {
    final adresse = await getAdressesByQuery(adresseComplete);
    var box = await Hive.openBox('tokenBox');
    var u = box.get('Token');
    var token = u.token;
    var payload = json.encode({
      'animal': animal,
      'dateEnd': dateEnd,
      'dateStart': dateStart,
      'description': description,
      'jeu': jeu,
      'lieuAdresse': adresse.features[0].properties.name,
      'lieuCodePostal': int.parse(adresse.features[0].properties.citycode),
      'lieuVille': adresse.features[0].properties.city,
      'name': name,
      'nbPersonne': nbPersonne,
      'price': price,
      'userToken': token.toString(),
    });

    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/create-loisir-service',
        method: 'POST',
        body: payload);

    if (response!.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response);
    }
  }

  static Future<String> insertMenage(
    String dateEnd,
    String dateStart,
    String description,
    String libelle,
    String adresseComplete,
    String materiel,
    String name,
    int nbHeure,
    int price,
  ) async {
    final adresse = await getAdressesByQuery(adresseComplete);
    var box = await Hive.openBox('tokenBox');
    var u = box.get('Token');
    var token = u.token;
    var payload = json.encode({
      'dateEnd': dateEnd,
      'dateStart': dateStart,
      'description': description,
      'libelle': libelle,
      'lieuAdresse': adresse.features[0].properties.name,
      'lieuCodePostal': int.parse(adresse.features[0].properties.citycode),
      'lieuVille': adresse.features[0].properties.city,
      'materiel': materiel,
      'name': name,
      'nbHeure': nbHeure,
      'price': price,
      'userToken': token.toString(),
    });

    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/create-tachemenagere-service',
        method: 'POST',
        body: payload);

    if (response!.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response);
    }
  }
}
