import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'recorded_audio_player.dart';
import 'recorder.dart';

class MyAudioRecorder extends StatefulWidget {
  const MyAudioRecorder({ Key? key }) : super(key: key);

  @override
  createState() => _MyAudioRecorderState();
}

class _MyAudioRecorderState extends State<MyAudioRecorder> {
  bool showPlayer = false;
  String? audioPath;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: showPlayer
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RecordedAudioPlayer(
                  source: audioPath!,
                  onDelete: () {
                    setState(() => showPlayer = false);
                  },
                ),
              )
            : Recorder(
                onStop: (path) {
                  if (kDebugMode) print('Gravação salva em: $path');
                  setState(() {
                    audioPath = path;
                    showPlayer = true;
                  });
                },
              ),
        ),
      );
  }
}