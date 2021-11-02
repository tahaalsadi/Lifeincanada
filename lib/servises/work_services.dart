import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lifeincanadalast/models/work_model.dart';

class WorkService {


  static Future<List<Workk>>? getWork() async {
    //  var url=Uri.https('www.canadians.life','/wp-json/wp/v2/posts?categories=69&per_page=50');
        const String ? url =
      'https://canadians.life/wp-json/wp/v2/posts?categories=69&per_page=50';
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Workk> list = parseWork(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Workk> parseWork(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Workk>((json) => Workk.fromJson(json!)).toList();
  }
}
