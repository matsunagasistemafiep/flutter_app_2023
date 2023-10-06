import 'package:flutter/material.dart';

import '../models/usuario_model.dart';

class Usuarios extends StatefulWidget {
  @override
  State<Usuarios> createState() {
    return UsuariosState();
  }
}

class UsuariosState extends State<Usuarios> {
  /// Lista de objetos da classe Usuario
  List<Usuario> _lista = [];

  @override
  void initState() {
    super.initState();
    _lista.add(
      Usuario(
        nome:"Fulano de Tal", 
        email:"fulano@mail.com",
        urlFoto:"https://i.pravatar.cc/300?img=5"
      )
    );
    _lista.add(
      Usuario(
        nome: "Beltrano de Tal", 
        urlFoto: "https://i.pravatar.cc/300?img=12"
      )
    );
    _lista.add(
      Usuario(
        nome: "Ciclano de Tal",
        urlFoto: "https://i.pravatar.cc/300?img=25",
        email: "ciclano@mail.com"
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Usuários")),
      body: ListView.builder(
        itemCount: _lista.length, // Tamanho da lista
        // context: contexto da aplicação (tela atual)
        // index: índice de cada item, iterado de 0 até n-1 (n = tamanho da lista)
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipOval(
              child: Image.network(_lista[index].urlFoto),
            ),
            title: Text(_lista[index].nome),
            subtitle: Text(_lista[index].email)
          );
        }
      )
    );
  }

}