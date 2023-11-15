import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({ Key? key }) : super(key: key);

  @override
  createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {

  TextEditingController urlController = TextEditingController();

  String videoID = 'WV-ZFRZz-Lc';

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'WV-ZFRZz-Lc',
    flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
    ),
  );  

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
      ),
      onReady: () {
        
      },
    );
  }
}