import 'package:cadastro_tasks/modules/config/settings.dart';
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
            leading: const Icon(Icons.people_alt),
            title: const Text("Lista de usuários"),
            subtitle: const Text("Pessoas cadastradas"),
            trailing: const Icon(Icons.arrow_forward_ios),
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
            title: const Text("Lista de tarefas"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => ListaTarefas()
                )
              );
            }
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Álbum de fotos"),
            subtitle: const Text("Visualização de imagens"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("Você tocou na lista");
            }
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configurações"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => const SettingsPage()
                )
              );
            }
          )
        ]
      )
    );
  }

}