import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lifeincanadalast/models/house_model.dart';

class HouseService {
 

  static Future<List<Housee>> getHouse() async {
    // var url=Uri.https('www.canadians.life','/wp-json/wp/v2/posts?categories=71&per_page=50');
       const String url =
      'https://canadians.life/wp-json/wp/v2/posts?categories=71&per_page=50';
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Housee> list = parseHouse(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Housee> parseHouse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Housee>((json) => Housee.fromJson(json)).toList();
  }
}
