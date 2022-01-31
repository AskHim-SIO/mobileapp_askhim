import 'dart:convert';
import 'package:ap4_askhim/models/homeCategorieService.dart';
import 'package:ap4_askhim/models/homeRecentService.dart';
import 'package:ap4_askhim/models/homeShuffleService.dart';
import 'package:hive/hive.dart';
import 'package:ap4_askhim/model/token_models.dart';

import 'base_service.dart';
import 'package:http/http.dart' as http;

class HomeService extends BaseService {
  static Future<List<RecentServices?>?> getRecentService() async {
    List<RecentServices> recentServices = [];
    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/get-recent-services',
        method: 'GET');
    //print(response!.body);
    if (response!.statusCode == 200) {
      var jsonList = json.decode(response.body);
      for (var service in jsonList) {
        recentServices.add(RecentServices.fromJson(service));
      }
      return recentServices;
    } else {
      throw Exception('Erreur');
    }
  }

  static Future<List<ShuffleService?>?> getShuffleService() async {
    List<ShuffleService> shuffleService = [];
    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/service/get-services',
        method: 'GET');
    //print(response!.body);
    if (response!.statusCode == 200) {
      var jsonList = json.decode(response.body);
      for (var service in jsonList) {
        shuffleService.add(ShuffleService.fromJson(service));
      }
      return shuffleService;
    } else {
      throw Exception('Erreur');
    }
  }

  static Future<List<CategorieService?>?> getCategoriesServices() async {
    List<CategorieService> categorieServices = [];
    http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri + '/type/get-types',
        method: 'GET');
    //print(response!.body);
    if (response!.statusCode == 200) {
      var jsonList = json.decode(response.body);
      for (var service in jsonList) {
        categorieServices.add(CategorieService.fromJson(service));
      }
      return categorieServices;
    } else {
      throw Exception('Erreur');
    }
  }
}
