

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:app_peliculas/src/models/peliculas_model.dart';

class PeliculasProvider {

  String _apikey = 'ef4f0f9fd5d69a45375846c2b508b97f';
  String _url    = 'api.themoviedb.org';
  String _language ='es-Es';

  Future<List<Pelicula>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apikey,
      'language': _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body); //toma la respuesta en string y lo devuelve en un mapa

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

}