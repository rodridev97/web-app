import 'package:flutter/material.dart';
import 'package:web_app/src/models/gif.dart';

import '../services/giphy_api.dart';

class GiphyApiProvider extends ChangeNotifier {
  List<GiphyModel> _gifs = [];

  List<GiphyModel> get gifs => this._gifs;

  set gifs(List<GiphyModel> newsGifs) {
    this._gifs = newsGifs;

    notifyListeners();
  }

  Future<void> gifsService() async {
    List<GiphyModel> serviceGifs = await GiphyApiService.gif.giphysImg;
    gifs = serviceGifs;
  }
}
