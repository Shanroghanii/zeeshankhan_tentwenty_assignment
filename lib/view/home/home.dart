import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/services/api_services/api_call.dart';
import 'package:task/utils/configue.dart';

import '../../model/upcoming_movie.dart';
import '../movie_details/movie_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch'),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUpcomingMoviesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingMoviesList() {
    return FutureBuilder<UpcomingMovies>(
      future: ApiCall().fetchUpcomingMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Padding(
            padding: EdgeInsets.all(28.0),
            child: CircularProgressIndicator(),
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return _buildMoviesListView(snapshot.data?.results);
        }
      },
    );
  }

  Widget _buildMoviesListView(List<Results>? moviesList) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: moviesList?.length ?? 0,
      itemBuilder: (context, index) {
        Results? data = moviesList?[index];
        return _buildMovieItem(context, data);
      },
    );
  }

  Widget _buildMovieItem(BuildContext context, Results? data) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                id: data?.id.toString() ?? "",
              ),
            ),
          );
        },
        child: _buildMovieContainer(data),
      ),
    );
  }

  Widget _buildMovieContainer(Results? data) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            ApiConstant.imageStorage + (data?.posterPath ?? ""),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            data?.originalTitle ?? '',
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
