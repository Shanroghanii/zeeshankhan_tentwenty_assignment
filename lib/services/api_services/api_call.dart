import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/movie.dart';
import '../../model/search_model.dart';
import '../../model/upcoming_movie.dart';
import '../../model/video_model.dart';
import '../../utils/configue.dart';

class ApiCall {
  Future<UpcomingMovies> fetchUpcomingMovies() async {
    try {
      final response = await http.get(
          Uri.parse('${ApiConstant.upcomingMovies}?api_key=${ApiConstant.key}'));
      print('${ApiConstant.upcomingMovies}?api_key=${ApiConstant.key}');
      if (response.statusCode == 200) {
        UpcomingMovies data =
        UpcomingMovies.fromJson(jsonDecode(response.body));

        return data;
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (error) {
      // Handle different types of errors that might occur
      print("Error: $error");
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<Movie> fetchMovies(id) async {
    try {
      final response = await http.get(
          Uri.parse('${ApiConstant.movie}/$id?api_key=${ApiConstant.key}'));
      print('${ApiConstant.movie}/$id?api_key=${ApiConstant.key}');
      if (response.statusCode == 200) {
        Movie data =
        Movie.fromJson(jsonDecode(response.body));
        print(response.body);
        return data;
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (error) {
      // Handle different types of errors that might occur
      print("Error: $error");
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<VideoModel> fetchMovieVideo(id) async {
    try {
      final response = await http.get(
          Uri.parse('${ApiConstant.movie}/$id/videos?api_key=${ApiConstant.key}'));
      print('${ApiConstant.movie}/$id/videos?api_key=${ApiConstant.key}');
      if (response.statusCode == 200) {
        print(response.body);
        VideoModel data =
        VideoModel.fromJson(jsonDecode(response.body));
        print(response.body);
        return data;
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (error) {
      // Handle different types of errors that might occur
      print("Error: $error");
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<SearchMovie> searchMovie(String keyword) async {
    try {
      final response = await http.get(
          Uri.parse('${ApiConstant.search}?query=$keyword&api_key=${ApiConstant.key}'));
      print('${ApiConstant.search}query=$keyword&api_key=${ApiConstant.key}');
      if (response.statusCode == 200) {
        print(response.body);
        SearchMovie data =
        SearchMovie.fromJson(jsonDecode(response.body));
        print(response.body);
        return data;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      // Handle different types of errors that might occur
      print("Error: $error");
      throw Exception('Failed to load movies');
    }
  }
}
