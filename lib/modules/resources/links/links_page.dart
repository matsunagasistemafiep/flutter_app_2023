
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

  List<bool> isExpandedList = [true, true, true, true, true];

  /// Abre uma página da web dentro do app
  /// url: uma URL válida.
  Future<void> _abrirSite(String url) async {
    Uri myURL = Uri.parse("https://$url");
    //if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    //}
  }


  Future<void> _fazerLigacao(String telefone) async {
    Uri myURL = Uri.parse("tel:+55$telefone");
    //if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    //}
  }

  Future<void> _enviarEmail(String email) async {
    Uri myURL = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'E-mail de teste'
      } 
    );
    if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    }
  }

  Future<void> _enviarSMS(String telefone) async {
    Uri myURL = Uri(
      scheme: 'sms',
      path: telefone,
      queryParameters: {
        'body': 'Olá, tudo bem?'
      }
    );
    //if (!await canLaunchUrl(myURL)) {
      launchUrl(myURL);
    //}
  }

  Future<void> _enviarWhatsapp(String whatsapp) async {
    var whatsappUrl = "whatsapp://send?phone=$whatsapp&text=Olá,tudo bem?";

    //if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    /*} else {
      throw 'Não foi possível abrir $whatsappUrl';
    }*/
  }

  TextEditingController urlControl = TextEditingController(text: "www.google.com");
  TextEditingController phoneControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("URL"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
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
             body: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: urlControl,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    )
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _abrirSite(urlControl.text);
                      },
                      child: const Text('Abrir página'),
                    ),
                  ),
                ],
               )
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
             body: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: phoneControl,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    )
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _fazerLigacao(phoneControl.text);
                      },
                      child: const Text('Fazer ligação'),
                    ),
                  ),
                ]
               )
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
             body: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailControl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    )
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _enviarEmail(emailControl.text);
                      },
                      child: const Text('Enviar e-mail'),
                    ),
                  )
               ]
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
             body: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: phoneControl,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    )
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _enviarSMS(phoneControl.text);
                      },
                      child: const Text('Enviar SMS'),
                    ),
                  ),
                  ]
                )
            ),
            isExpanded: isExpandedList[3]
           ),

           ExpansionPanel(
             headerBuilder: (BuildContext context, bool isExpanded) {
               return const ListTile(
                 leading: Icon(Icons.send),
                 title: Text('WhatsApp'),
               );
             },
             body: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: phoneControl,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    )
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _enviarWhatsapp("+55${phoneControl.text}");
                      },
                      child: const Text('Enviar WhatsApp'),
                      ),
                    ),
                ]
              ),
            ),
            isExpanded: isExpandedList[4]
           ),
         ],
        )
      )
    );
  }

}
