import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lifeincanadalast/models/nationalty_model.dart';

class NationaltyService {
  

  static Future<List<Nationaltyy>> getNationalty() async {
    // var url=Uri.https('www.canadians.life','/wp-json/wp/v2/posts?categories=255&per_page=50');
    const String url =
      'https://canadians.life/wp-json/wp/v2/posts?categories=255&per_page=50';
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Nationaltyy> list = parseNationalty(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Nationaltyy> parseNationalty(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Nationaltyy>((json) => Nationaltyy.fromJson(json)).toList();
  }
}
