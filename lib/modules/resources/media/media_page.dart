import 'package:flutter/material.dart';
import 'package:my_flutter_app/modules/resources/media/widgets/my_audio_player.dart';
import 'package:my_flutter_app/modules/resources/media/widgets/my_audio_recorder.dart';
import 'package:my_flutter_app/modules/resources/media/widgets/my_video_player.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({ Key? key }) : super(key: key);

  @override
  createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.music_note)),
            Tab(icon: Icon(Icons.videocam)),
            Tab(icon: Icon(Icons.record_voice_over))
          ])
        ),
        body: const TabBarView(
          children: [
            MyAudioPlayer(),
            MyVideoPlayer(),
            MyAudioRecorder(),
          ]
        )
      )
    );
  }
}