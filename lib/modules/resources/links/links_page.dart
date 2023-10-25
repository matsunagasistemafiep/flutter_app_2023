
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksPage extends StatefulWidget {

  const LinksPage({super.key});

  @override
  State<LinksPage> createState() {
    return _LinksPageState();
  }

}

class _LinksPageState extends State<LinksPage> {

  Future<void> _abrirSite(String url) async {
    Uri myURL = Uri.parse("https://$url");
    if (!await launchUrl(myURL)) {
      throw Exception('Não foi possível abrir o link $myURL');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("URL"),
      ),
      body: Column(
        children: [
          Material(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _abrirSite('www.google.com');
                },
                child: const Text('Abrir página'),
              ),
            ),
          ),
          ],
      ),
    );
  }

}
