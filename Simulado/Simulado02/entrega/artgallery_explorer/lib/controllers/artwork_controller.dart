import 'dart:convert';

import 'package:artgallery_explorer/models/artwork.dart';
import 'package:http/http.dart' as http;

class ArtworkController{
  Future<List<Artwork>> fetchArtworks() async{
    final response = await http.get(
      Uri.parse('http://10.0.2.2:3000/artworks')
    );

    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Artwork.fromMap(json)).toList();
    }

    else {
      throw Exception("Failed to load artworks");
    }
  }

  Future<List<Artwork>> fetchFeaturedArtworks() async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/artworks?isFeatured=true')
    );

    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Artwork.fromMap(json)).toList();
    }

    else {
      throw Exception("Failed to load artworks");
    }
  }

  Future<Artwork> fetchArtworkById(int id) async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/artworks/$id')
    );

    if(response.statusCode == 200){
      return Artwork.fromMap(jsonDecode(response.body) as Map<String, dynamic>);
    }

    else {
      throw Exception("Failed to load artworks");
    }
  }

}