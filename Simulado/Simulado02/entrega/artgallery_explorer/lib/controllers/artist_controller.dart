import 'dart:convert';

import 'package:artgallery_explorer/models/artist.dart';
import 'package:http/http.dart' as http;

class ArtistController{

  Future<List<Artist>> fetchArtists() async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/artists')
    );

    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Artist.fromMap(json)).toList();
    }

    else {
      throw Exception("Failed to load artworks");
    }
  }

  Future<Artist> fetchArtistById(int id) async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/artists/$id')
    );

    if(response.statusCode == 200){
      return Artist.fromMap(jsonDecode(response.body) as Map<String, dynamic>);
    }

    else {
      throw Exception("Failed to load artworks");
    }
  }
}