import 'package:flutter/material.dart';
import 'package:task/utils/color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerW extends StatelessWidget {
  final String videoId; // YouTube video ID

  const VideoPlayerW({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: true, // Auto-play the video
              mute: false, // Allow sound
            ),
          ),
          showVideoProgressIndicator: true, // Show video progress bar
          progressIndicatorColor: Colors.blueAccent, // Progress bar color
          progressColors: const ProgressBarColors(
            playedColor: blueColor,
            handleColor: Colors.blueAccent,
          ),
          onEnded: (metadata) {
            Navigator.pop(
                context); // Return to the previous screen when video ends
          },
        ),
      ),
    );
  }
}

