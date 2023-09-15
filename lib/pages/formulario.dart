import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormularioState();
  }
}

class FormularioState extends State<Formulario> {

  String _sexoSelecionado = "M";
  bool _webSelecionado=false, _mobileSelecionado=false;
  List<String> _listaSelecionados = [];
  double _idade = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView( // Serve para adicionar Scroll
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Seu nome",
                  prefixIcon: const Icon(Icons.person)
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.article),
                  hintText: "Sobre você",
                  border: OutlineInputBorder()
                )
              ),
              const SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Telefone",
                  border: OutlineInputBorder()
                )
              ),
              const SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "E-mail",
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Cidade",
                  prefixIcon: Icon(Icons.location_city)
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Londrina",
                    child: Text("Londrina-PR")
                  ),
                  DropdownMenuItem(
                    value: "Cambé",
                    child: Text("Cambé-PR")
                  ),
                  DropdownMenuItem(
                    value: "Rolândia",
                    child: Text("Rolândia-PR")
                  )
                ], 
                onChanged: (value) => {
                  print(value)
                }
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  ListTile(
                    title: const Text("Masculino"),
                    leading: Radio(
                      value: "M",
                      groupValue: _sexoSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _sexoSelecionado = value!;
                        });
                      }
                    )
                  ),
                  ListTile(
                    title: const Text("Feminino"),
                    leading: Radio(
                      value: "F",
                      groupValue: _sexoSelecionado,
                      onChanged: (value) {
                        setState(() {
                          //value = null;
                          _sexoSelecionado = value ?? "F";
                        });
                      }
                    )
                  )
                ]
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Desenvolvimento web"),
                    leading: Checkbox(
                      value: _webSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _webSelecionado = value!;
                          (_webSelecionado) ? _listaSelecionados.add("web") : 
                                              _listaSelecionados.remove("web");
                          print(_listaSelecionados);
                        });
                      }
                    )
                  ),
                  ListTile(
                    title: const Text("Desenvolvimento mobile"),
                    leading: Checkbox(
                      value: _mobileSelecionado,
                      onChanged:(value) {
                        setState(() {
                          _mobileSelecionado = value!;
                          (_mobileSelecionado) ? _listaSelecionados.add("mobile") : 
                                                 _listaSelecionados.remove("mobile");
                          print(_listaSelecionados);
                        });
                      },
                    ),
                  )
                ]
              ),
              const Divider(),
              Slider(
                value: _idade,
                min: 0,
                max: 120,
                divisions: 120,
                label: "Idade ${_idade.round()}",
                onChanged: (value) {
                  setState(() {
                    _idade = value;
                  });
                },
              )
            ]
          )
        )
      )
    );
  }

}