
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


/// https://github.com/bluefireteam/audioplayers/blob/main/getting_started.md
class AudioVideoPage extends StatefulWidget {

  const AudioVideoPage({super.key});

  @override
  State<AudioVideoPage> createState() {
    return _AudioVideoPageState();
  }

}

class _AudioVideoPageState extends State<AudioVideoPage> {
  final player = AudioPlayer();

  final YoutubePlayerController _youtubeController = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
    ),
  );



  @override
  void initState() {
    super.initState();
  }

  reproduzirAudio() async {
    //await player.setSource(AssetSource('audio/sound.wav'));
    await player.play(AssetSource('audio/sound.wav'));
  }
  
  pausarAudio() async {
    await player.pause(); 
  }

  pararAudio() async {
    await player.stop();
  }

  iniciarGravacao() async {
  }

  pausarGravacao() async {
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reprodutor de mídia"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.music_note), text: "Áudio"),
              Tab(icon: Icon(Icons.video_camera_back), text: "Vídeo"),
              Tab(icon: Icon(Icons.record_voice_over), text: "Gravação"),
            ]
          )
        ),
        body: TabBarView(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    reproduzirAudio();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: () {
                    pararAudio();
                  },
                )
              ],
              
            ),
            Container(
              child: YoutubePlayer(
                controller: _youtubeController,
                showVideoProgressIndicator: true,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    iniciarGravacao();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: () {
                    pausarGravacao();
                  },
                )
              ],
              
            )
          ],
        )
      )
    );
  }

}
