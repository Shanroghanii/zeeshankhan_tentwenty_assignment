import 'package:flutter/material.dart';
import '../../model/movie.dart';
import '../../model/video_model.dart';
import '../../services/api_services/api_call.dart';
import '../../utils/color.dart';
import '../../utils/configue.dart';
import '../seat_booking/seat_booking.dart';
import '../video_player/video_player.dart';
import '../widgets/buttons.dart';
import 'movie_detail_provider.dart';


class MovieDetailScreen extends StatelessWidget {
  final String id;
  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Movie>(
        future: ApiCall().fetchMovies(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Movie data = snapshot.data!;
            return _buildMovieDetails(context, data);
          }
        },
      ),
    );
  }

  Widget _buildMovieDetails(BuildContext context, Movie data) {
    return Scaffold(
      appBar: _buildCustomAppBar(context, data),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGenres(data),
              const SizedBox(height: 20),
              _buildOverview(data),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildCustomAppBar(BuildContext context, Movie data) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(350),
      child: Stack(
        children: [
          _buildBackgroundImage(data),
          _buildAppBarContent(context,data),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(Movie data) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            ApiConstant.imageStorage + (data.posterPath ?? ""),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarContent(BuildContext context, Movie data) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Watch',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          _buildButtons(context,data),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context, Movie data) {
    return Column(
      children: [
        Text(
          'In Theaters ${data.releaseDate}',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: 200,
            child: ElevatedButtonW(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatBooking(
                      data: data,
                    ),
                  ),
                );
              },
              buttonText: 'Get Tickets',
            )),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: 200,
            child: ElevatedButtonW(
              ontap: () async {
                _handleWatchTrailer(context, id);
              },
              buttonText: '▶ Watch Trailer',
              buttonColor: Colors.transparent,
              borderColor: blueColor,
              buttonTextColor: Colors.white,
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Future<void> _handleWatchTrailer(BuildContext context, String id) async {
    try {
      VideoModel result = await ApiCall().fetchMovieVideo(id);
      if (result.results != null && result.results!.isNotEmpty) {
        String videoId = result.results!.last.key ?? "";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerW(videoId: videoId),
          ),
        );
      } else {
        // Handle case when video data is empty
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No video available')),
        );
      }
    } catch (e) {
      // Handle API call error
      print('Error fetching video: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch video')),
      );
    }
  }

  Widget _buildGenres(Movie data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Genres',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.genres?.length ?? 0,
            itemBuilder: (context, index) {
              return _buildGenreCard(data.genres![index].name ?? "");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGenreCard(String name) {
    return Card(
      color: getRandomColor(), // Implement your getRandomColor function
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildOverview(Movie data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10,),
        Text(
          data.overview ?? '',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
