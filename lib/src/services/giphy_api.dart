import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:web_app/src/models/gif.dart';

class GiphyApiService {
  static const gif = GiphyApiService._();
  // static const String _apiKey = '';
  static const String _endpoint =
      'https://api.giphy.com/v1/gifs/trending?api_key=o3OhZgGVDwiP2D3ssRABqF8PMsKTy7ZD';

  const GiphyApiService._();

  Future<List<GiphyModel>> get giphysImg async {
    List<GiphyModel> gifs = [];
    var url = Uri.parse(_endpoint);
    var response = await http.get(url);

    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      List<dynamic> data = jsonResponse['data'];

      return data
          .map((e) => GiphyModel.fromJson(jsonResponse['data'][1]))
          .toList();
    } else {
      return [];
    }
  }
}
