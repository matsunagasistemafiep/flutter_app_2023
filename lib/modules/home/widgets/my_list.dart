import 'package:flutter/material.dart';

import '../../tasks/screens/main_task.dart';
import '../../users/screens/usuarios.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView( // Visualizador de listas
        children: [ // ListTile: cada item da lista
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Lista de tarefas"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => const MainTask()
                )
              );
            }
          ),
          ListTile(
            leading: const Icon(Icons.people_alt),
            title: const Text("Lista de usuários"),
            subtitle: const Text("Pessoas cadastradas"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //print("Você tocou na lista");
              // Navegando para uma nova tela
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => Usuarios()
                )
              );
            }
          ),
          /*ListTile(
            leading: Icon(Icons.photo),
            title: Text("Álbum de fotos"),
            subtitle: Text("Visualização de imagens"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("Você tocou na lista");
            }
          ),*/
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configurações"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //print("Você tocou na lista");
            }
          )
        ]
      );
  }

} 