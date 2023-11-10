import 'package:my_flutter_app/modules/resources/geolocation/geolocation_page.dart';
import 'package:my_flutter_app/modules/resources/image/image_page.dart';
import 'package:my_flutter_app/modules/resources/links/links_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/home/screens/home.dart';
import '../modules/resources/audio_video/audio_video_page.dart';

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> {
  
  int _selectedIndex = 0;
  String meuNome = "";

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    LinksPage(),
    ImagesPage(),
    GeolocationPage(),
    AudioVideoPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void atualizarNome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myName = prefs.getString('userName');
    setState(() {
      meuNome = myName!;
    });
  }

  @override
  void initState() {
    atualizarNome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá $meuNome"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 172, 209, 240),
                    Color.fromARGB(255, 87, 169, 236),
                    Color.fromARGB(255, 11, 133, 233)
                  ]
                )
              ),
              child: Text('Acessar recursos'),
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.home),
                  Text(" Home")
                ],
              ),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.link),
                  Text(" Links")
                ],
              ),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.photo),
                  Text(" Imagens")
                ],
              ),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.location_on),
                  Text(" Geolocalização")
                ],
              ),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.music_note),
                  Text(" Multimídia")
                ],
              ),
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      
      body: _widgetOptions[_selectedIndex],
    );
  }

}