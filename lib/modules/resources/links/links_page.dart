
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
    if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("URL"),
      ),
      body: SingleChildScrollView(
        child: Container(child: 
         ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {},
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('URL'),
                );
              },
              body: ListTile(
                title: Text('Item 1 child'),
                subtitle: Text('Details goes here'),
              ),
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('Telefone'),
                );
              },
              body: ListTile(
                title: Text('Item 2 child'),
                subtitle: Text('Details goes here'),
              ),
            ),
          ],
        )
      /*Column(
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
      ),*/
        )
      )
    );
  }

}
