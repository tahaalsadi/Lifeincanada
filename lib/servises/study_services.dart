import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lifeincanadalast/models/study_model.dart';
class StudyServices {
 

  static Future<List<Studyy>> getStudy() async {
    // var url=Uri.https('www.canadians.life','/wp-json/wp/v2/posts?categories=139&per_page=50' );
      const String url =
      'https://canadians.life/wp-json/wp/v2/posts?categories=139&per_page=50';
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Studyy> list = parseSTUDY(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Studyy> parseSTUDY(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Studyy>((json) => Studyy.fromJson(json)).toList();
  }
}
