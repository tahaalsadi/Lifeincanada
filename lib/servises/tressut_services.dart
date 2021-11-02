import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lifeincanadalast/models/tresut_model.dart';

class TresutService {


  static Future<List<Tresut>> getTresut() async {
    // var url=Uri.https('www.canadians.life','/wp-json/wp/v2/posts?categories=308&per_page=50'); 
    const String url =
      'https://canadians.life/wp-json/wp/v2/posts?categories=308&per_page=50';
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Tresut> list = parseWork(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Tresut> parseWork(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Tresut>((json) => Tresut.fromJson(json)).toList();
  }
}
