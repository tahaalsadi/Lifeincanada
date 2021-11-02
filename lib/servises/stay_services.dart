import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lifeincanadalast/models/stay_model.dart';

class StayService {


  static Future<List<Stayy>> getStay() async {
    // var url=Uri.https('www.canadians.life','/wp-json/wp/v2/posts/?categories=22&per_page=50', );
       const String url =
      'https://canadians.life/wp-json/wp/v2/posts/?categories=22&per_page=50';
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Stayy> list = parseStay(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Stayy> parseStay(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Stayy>((json) => Stayy.fromJson(json)).toList();
  }
}
