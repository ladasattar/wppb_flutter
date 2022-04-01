// ignore_for_file: prefer_const_declarations

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:week7/data/model/destination.dart';
import '../model/destination.dart';

class ApiService {
  static final String _baseUrl = 'http://10.0.2.2:8000/api/destinations/';

  Future<Destinations> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return Destinations.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
