
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

  List<bool> isExpandedList = [true, false, false, false];

  Future<void> _abrirSite(String url) async {
    Uri myURL = Uri.parse("https://$url");
    if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    }
  }

  Future<void> _fazerLigacao(String telefone) async {
    Uri myURL = Uri.parse("tel:$telefone");
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
    final Uri myURL = Uri(
      scheme: 'sms',
      path: telefone,
      queryParameters: <String, String>{
        'body': "Mensagem de teste por SMS."
      },
    );
    if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    }
  }

  /// whatsapp://send?phone=5586994324465&text=Olá,tudo bem ?"
  Future<void> _enviarWhatsapp(String whatsapp) async {
    final Uri myURL = Uri(
      scheme: 'whatsapp://',
      path: 'send',
      queryParameters: {
        'phone': whatsapp,
        'text': 'Olá, tudo bem?'
      }
    );
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
            setState(() {
              isExpandedList[index] = isExpanded;
            });
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
                      _abrirSite('www.youtube.com');
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
                      _fazerLigacao('+5544999244223');
                    },
                    child: const Text('Abrir página'),
                  ),
                ),
              ),
              isExpanded: isExpandedList[1]
            ),

            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  leading: Icon(Icons.email),
                  title: Text('E-mail'),
                );
              },
              body: Material(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _enviarEmail('ftakematsu@gmail.com');
                    },
                    child: const Text('Enviar e-mail'),
                  ),
                ),
              ),
              isExpanded: isExpandedList[2]
            ),

            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  leading: Icon(Icons.sms),
                  title: Text('SMS'),
                );
              },
              body: Material(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _enviarSMS('+5544999244223');
                      //_enviarWhatsapp('+554499244223'); 
                    },
                    child: const Text('Enviar SMS'),
                  ),
                ),
              ),
              isExpanded: isExpandedList[3]
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
