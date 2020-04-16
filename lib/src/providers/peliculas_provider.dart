

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:app_peliculas/src/models/peliculas_model.dart';

class PeliculasProvider {

  String _apikey = 'ef4f0f9fd5d69a45375846c2b508b97f';
  String _url    = 'api.themoviedb.org';
  String _language ='es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{

      final resp = await http.get(url);
      final decodedData =  json.decode(resp.body);
      final peliculas = new Peliculas.fromJsonList(decodedData['results']);

      return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apikey,
      'language': _language,
    });

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async{
     final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apikey,
      'language': _language,
     });

    return await _procesarRespuesta(url);

  }
}