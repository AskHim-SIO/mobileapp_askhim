import 'package:http/http.dart' as http;

class BaseService {

  //static const baseUri = "https://api.askhim.ctrempe.fr/";
  static const baseUri = "http://askhim.ctrempe.fr:4002";

  //static const baseUri = "http://localhost:4001";
//static const baseUri = "http://192.168.49.11:4001";
  //static const baseUri = "127.0.0.1:3306";

  static final Map<String, String> headers = {
    'Content-type': 'application/json'
  };

  static Future<http.Response?> makeRequest(String url,
      {String method = "POST",
      body,
      mergeDefaultHeader = true,
      Map<String, String>? extraHeaders}) async {
    try {
      print('Requête vers : ' + url + ' (méthode '+ method + ')');
      extraHeaders ??= {};
      var sentHeaders =
          mergeDefaultHeader ? {...headers, ...extraHeaders} : extraHeaders;

      switch (method) {
        case 'POST':
          body ??= {};
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);

        case 'GET':
          body ??= {};
          return http.get(Uri.parse(url), headers: sentHeaders);

        case 'PUT':
          body ??= {};
          return http.put(Uri.parse(url), headers: sentHeaders, body: body);

        case 'DELETE':
          body ??= {};
          return http.delete(Uri.parse(url), headers: sentHeaders);

        default:
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);
      }
    } catch (err) {
      print(err);
    }
  }
}
