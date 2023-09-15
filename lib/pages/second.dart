import 'package:flutter/material.dart';

import 'lista_tarefas.dart';
import 'usuarios.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<StatefulWidget> createState() {
    return SecondState();
  }
}

class SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView( // Visualizador de listas
        children: [ // ListTile: cada item da lista
          ListTile(
            leading: Icon(Icons.people_alt),
            title: Text("Lista de usuários"),
            subtitle: Text("Pessoas cadastradas"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("Você tocou na lista");
              // Navegando para uma nova tela
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => Usuarios()
                )
              );
            }
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: Text("Lista de tarefas"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => ListaTarefas()
                )
              );
            }
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text("Álbum de fotos"),
            subtitle: Text("Visualização de imagens"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("Você tocou na lista");
            }
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configurações"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("Você tocou na lista");
            }
          )
        ]
      )
    );
  }

}