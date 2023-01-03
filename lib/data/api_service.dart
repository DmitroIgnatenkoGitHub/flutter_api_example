import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/models/cat.dart';
import 'package:flutter_api_example/models/cat_gallery.dart';
import 'package:flutter_api_example/models/cat_image.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Cat>> getAllCats() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.thecatapi.com/v1/breeds"));

      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => Cat.fromJson(model)).toList();
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }

  //! can be nullable now
  Future<String> getImageUrlByBreedId(String id) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.thecatapi.com/v1/images/search?breed_ids=$id'));

      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => CatImage.fromJson(model)).toList()[0].url;
    } catch (e) {
      debugPrint("$e");
    }
    return "";
  }

  Future<List<CatGallery>> getImagesUrlByBreedId(String id) async {
    try {
      final response =
          await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=$id&api_key=REPLACE_ME"));

      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => CatGallery.fromJson(model)).toList();
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }
}
