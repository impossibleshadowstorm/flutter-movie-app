import 'dart:convert';
import '../models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl = 'https://api.tvmaze.com/search/shows?q=all';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body) as List;
      return decodedData.map((movie) => Movie.fromJson(movie["show"])).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)as List;
      return decodedData.map((movie) => Movie.fromJson(movie["show"])).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> fetchMovies(String query) async {
    final String url = 'https://api.tvmaze.com/search/shows?q=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body) as List;
      return decodedData.map((movie) => Movie.fromJson(movie["show"])).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
