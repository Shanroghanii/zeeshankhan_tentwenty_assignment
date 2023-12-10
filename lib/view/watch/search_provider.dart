import 'package:flutter/material.dart';
import 'package:task/services/api_services/api_call.dart';

import '../../model/search_model.dart';

// ChangeNotifier class for managing search and fetching results
class SearchProvider extends ChangeNotifier {
  SearchMovie searchResults = SearchMovie();

  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  removeSearch() {
    searchController.text = '';
    notifyListeners();
  }

  Future<void> fetchSearchResults(String query) async {
    searchResults = SearchMovie();
    isLoading = true;
    notifyListeners();

    // Simulating an API call delay for demonstration
    searchResults = await ApiCall().searchMovie(query);

    // In a real scenario, make an API request using the query
    // Replace this with your actual API call
    // For demonstration, storing dummy search results

    isLoading = false;
    notifyListeners();
  }

  String getGenreNameById(int id) {
    Map<int, String> genreMap = {
      28: "Action",
      12: "Adventure",
      16: "Animation",
      35: "Comedy",
      80: "Crime",
      99: "Documentary",
      18: "Drama",
      10751: "Family",
      14: "Fantasy",
      36: "History",
      27: "Horror",
      10402: "Music",
      9648: "Mystery",
      10749: "Romance",
      878: "Science Fiction",
      10770: "TV Movie",
      53: "Thriller",
      10752: "War",
      37: "Western",
    };

    // Check if the genre ID exists in the map
    if (genreMap.containsKey(id)) {
      return genreMap[id]!;
    } else {
      return "Unknown Genre";
    }
  }
}
