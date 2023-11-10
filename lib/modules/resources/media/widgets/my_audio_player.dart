import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyAudioPlayer extends StatefulWidget {
  const MyAudioPlayer({ Key? key }) : super(key: key);

  @override
  createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {

  /// Objeto responsável por reproduzir os áudios
  final AudioPlayer player = AudioPlayer();

  bool isPlaying = false;

  reproduzirAudio() async {
    await player.play(AssetSource('audios/myaudio.wav'));
  }

  pausarAudio() async {
    await player.pause();
  }

  pararAudio() async {
    await player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (!isPlaying) ? IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              reproduzirAudio();
              setState(() {
                isPlaying = true;
              });
            }
          )
          : IconButton(
            icon: const Icon(Icons.pause),
            onPressed: () {
              pausarAudio();
              setState(() {
                isPlaying = false;
              });
            }
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () {
              pararAudio();
              setState(() {
                isPlaying = false;
              });
            }
          )
        ],
      ),
    );
  }
}