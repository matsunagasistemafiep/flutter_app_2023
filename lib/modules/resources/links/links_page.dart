
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

  List<bool> isExpandedList = [false, false, false];

  Future<void> _abrirSite(String url) async {
    Uri myURL = Uri.parse("https://$url");
    if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    }
  }

  Future<void> _fazerLigacao(String telefone) async {
    Uri myURL = Uri.parse("tel:+55$telefone");
    if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    }
  }

  Future<void> _enviarEmail(String email) async {
    Uri myURL = Uri.parse("mailto:$email?subject=Teste");
    if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    }
  }

  Future<void> _enviarSMS(String telefone) async {
    Uri myURL = Uri.parse("sms:$telefone");
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
          expansionCallback: (int index, bool isExpanded) {
            isExpandedList[index] = isExpanded;
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  leading: Icon(Icons.web),
                  title: Text('URL'),
                );
              },
              body: Material(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _abrirSite('www.google.com');
                    },
                    child: const Text('Abrir página'),
                  ),
                ),
              ),
              isExpanded: isExpandedList[0]
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Telefone'),
                );
              },
              body: Material(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _fazerLigacao('44999887766');
                    },
                    child: const Text('Abrir página'),
                  ),
                ),
              ),
              isExpanded: isExpandedList[1]
            ),
          ],
        )
      /*Column(
        children: [
          
          ],
      ),*/
        )
      )
    );
  }

}
