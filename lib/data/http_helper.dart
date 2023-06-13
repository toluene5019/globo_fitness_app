import 'package:http/http.dart' as http; 
import 'dart:convert';

import 'weather.dart';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/
  //weather?q=Lviv&appid=2c8df175689743ab812f496e8d1271e5
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '2c8df175689743ab812f496e8d1271e5';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location,  'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}