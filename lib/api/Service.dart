import 'dart:convert';
import 'CatImage.dart';
import 'package:http/http.dart' as http;

class Service {
  final String baseUrl = "https://api.thecatapi.com/v1";

  Future<CatImage> elementImage() async {
    final response = await http.get(Uri.parse('$baseUrl/images/search'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      print('API Response: $jsonResponse'); // Debug print
      return CatImage.fromJson(jsonResponse[0]);
    } else {
      throw Exception("Error de consumo de API");
    }
  }
}