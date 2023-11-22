import 'package:flutter/material.dart';
//import 'package:my_flutter_app/modules/resources/media/widgets/my_audio_player.dart';
import 'package:my_flutter_app/modules/resources/media/widgets/my_audio_recorder.dart';
import 'package:my_flutter_app/modules/resources/media/widgets/my_video_player.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({ Key? key }) : super(key: key);

  @override
  createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {

  List<Widget> widgetList = [
    //MyAudioPlayer(),
    const MyAudioRecorder(),
    const MyVideoPlayer(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widgetList.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            //Tab(icon: Icon(Icons.music_note)),
            Tab(icon: Icon(Icons.record_voice_over)),
            Tab(icon: Icon(Icons.videocam)),
          ])
        ),
        body: TabBarView(
          children: widgetList
        )
      )
    );
  }
}