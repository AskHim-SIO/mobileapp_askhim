import 'dart:convert';

import 'package:ap4_askhim/models/chat/getDiscussionByUuid.dart';
import 'package:ap4_askhim/models/chat/getListMessageByUserToken.dart';
import 'package:hive/hive.dart';
import 'package:ap4_askhim/model/token_models.dart';
import 'base_service.dart';
import 'package:http/http.dart' as http;

class ChatService extends BaseService {
  static Future<List<GetListMessageByUserToken?>?>
      getListMessageByUserToken() async {
    List<GetListMessageByUserToken> listMessageByUser = [];

    var box = await Hive.openBox('tokenBox');
    if (box.get('Token') != null) {
      var u = box.get('Token');
      var token = u.token;
      http.Response? response = await BaseService.makeRequest(
        BaseService.baseUri +
            '/chat/get-discussions-from-user-by-token/' +
            token,
        method: 'GET',
      );
      if (response!.statusCode == 200) {
        var jsonList = json.decode(response.body);
        for (var service in jsonList) {
          listMessageByUser.add(GetListMessageByUserToken.fromJson(service));
        }
        return listMessageByUser;
      } else {
        throw Exception('erreur');
      }
    }
  }

  static Future<Map<String, dynamic>?> getDiscussionByUuid(String uuid) async {
    http.Response? response = await BaseService.makeRequest(
      BaseService.baseUri + '/chat/get-discussion-by-id/' + uuid,
      method: 'GET',
    );
    if (response!.statusCode == 200) {
      Map<String, dynamic> data =
          new Map<String, dynamic>.from(json.decode(response.body));
      return data;
    }
  }

  static Future<String> initDiscussion(int serviceId) async {
    var box = await Hive.openBox('tokenBox');
    if (box.get('Token') != null) {
      var u = box.get('Token');
      var token = u.token;

      final String url =
          'http://api.askhim.ctrempe.fr:80/chat/init-discussion?serviceId=$serviceId&userToken=$token';
      http.Response res = await http.post(Uri.parse(url));
      if (res.statusCode == 200) {
        String data = json.decode(json.encode(res.body));
        return data;
      } else {
        return res.statusCode.toString();
      }
    } else {
      return throw Exception('erreur');
    }
  }

  static Future<bool> postChat(String discussionId, String query) async {
    var box = await Hive.openBox('tokenBox');
    if (box.get('Token') != null) {
      var u = box.get('Token');
      var token = u.token;

      final String url =
          'http://api.askhim.ctrempe.fr:80/chat/post-message?discussionId=$discussionId&userToken=$token&message=$query';
      http.Response res = await http.post(Uri.parse(url));
      if (res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      return throw Exception('erreur');
    }
  }

  static Future<bool> validateService(int serviceId, int userId) async {
    final String url =
        'http://api.askhim.ctrempe.fr:80/service/validate-service?serviceId=$serviceId&userId=$userId';
    http.Response res = await http.put(Uri.parse(url));
    if (res.statusCode == 200) {
      return true;
    } else {
      print(res.body);
      return false;
    }
  }
}
