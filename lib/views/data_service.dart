import 'dart:convert';

import 'package:http/http.dart ' as http;

import '../model.dart';

class Dataservice {
  Future<WeatherResponse> dataserice(String city) async {
    final query = {
      'q': city,
      'appid': '4378f1f0ae3811090c5598cb3c5aaffc',
      'units': 'imperail'
    };
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    final uri = Uri.http('api.openweathermap.org', 'data/2.5/weather', query);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
