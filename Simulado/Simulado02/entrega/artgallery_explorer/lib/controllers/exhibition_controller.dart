import 'dart:convert';

import 'package:artgallery_explorer/models/exhibition.dart';
import 'package:http/http.dart' as http;

class ExhibitionController {
  Future<List<Exhibition>> fetchCurrentExhibitions() async {
    final uri = Uri.http('10.0.2.2:3000', '/exhibitions', {
      'status': ['current', 'upcoming'],
    });
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Exhibition.fromMap(json)).toList();
    } else {
      throw Exception("Failed to load artworks");
    }
  }

  Future<Exhibition> fetchExhibitionById(int id) async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/exhibitions/$id')
    );

    if(response.statusCode == 200){
      return Exhibition.fromMap(jsonDecode(response.body) as Map<String, dynamic>);
    }

    else {
      throw Exception("Failed to load artworks");
    }
  }
}
