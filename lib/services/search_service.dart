import 'dart:convert';
import 'package:ap4_askhim/models/getSearchByQuery.dart';
import 'base_service.dart';
import 'package:http/http.dart' as http;

class SearchService extends BaseService {
  static Future<List<GetSearchByQuery?>?>? getSearchByQuery(
      String? query, int count) async {
    List<GetSearchByQuery> searchByQuery = [];
    http.Response? response = await BaseService.makeRequest(
      BaseService.baseUri +
          '/service/search-services?query=' +
          query.toString() +
          "&count=" +
          count.toString(),
      method: 'GET',
    );
    if (response!.statusCode == 200) {
      var jsonList = json.decode(response.body);
      for (var service in jsonList) {
        searchByQuery.add(GetSearchByQuery.fromJson(service));
      }
      return searchByQuery;
    } else {
      throw Exception('Erreur');
    }
  }
}
