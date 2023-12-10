import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/utils/color.dart';
import 'package:task/view/watch/search_provider.dart';

import '../../utils/configue.dart';
import '../movie_details/movie_details.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(context),
            searchProvider.searchController.text != ''
                ? const SearchResults()
                : _buildMoviesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextFormField(
            controller: searchProvider.searchController,
            decoration: InputDecoration(
              fillColor: backgroundColor,
              prefixIcon: const Icon(Icons.search),
              hintText: 'TV shows, movies and more',
              suffixIcon: InkWell(
                  onTap: () {
                    searchProvider.removeSearch();
                  },
                  child: const Icon(Icons.close)),
            ),
            onChanged: (val) {
              searchProvider.fetchSearchResults(val);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMoviesGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildMovieItem();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 0, // Spacing between columns
          mainAxisSpacing: 0,
          childAspectRatio: 1.5, // Spacing between rows
        ),
      ),
    );
  }

  Widget _buildMovieItem() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          // Navigation logic for movie detail screen
        },
        child: Container(
          decoration: BoxDecoration(
            color: darkGray,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.pexels.com/photos/458379/pexels-photo-458379.jpeg?auto=compress&cs=tinysrgb&w=600',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Movie Name',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Get the size of the screen
    Size screenSize = mediaQueryData.size;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Top Result"),
          const Divider(),
          searchProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: searchProvider.searchResults.results?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(
                              id: searchProvider
                                      .searchResults.results?[index].id
                                      .toString() ??
                                  "",
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenSize.width * 0.35,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: darkGray,
                                    ),
                                    child: Image.network(
                                      getImage(searchProvider, index),
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: screenSize.width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    searchProvider.searchResults.results?[index]
                                            .title ??
                                        "",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                  Text(getGenre(searchProvider, index),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                            Transform.rotate(
                              angle: 1.5708,
                              child: const Icon(
                                Icons.more_vert_sharp,
                                color: blueColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
        ],
      ),
    );
  }

  String getGenre(SearchProvider searchProvider, int index) {
    return searchProvider.searchResults.results?[index].genreIds?.isNotEmpty ??
            false
        ? searchProvider.getGenreNameById(
            searchProvider.searchResults.results?[index].genreIds?.first ?? 0)
        : 'Unknown Genre';
  }

  String getImage(SearchProvider searchProvider, int index) {
    return ApiConstant.imageStorage +
        (searchProvider.searchResults.results?[index].posterPath ?? "");
  }
}
