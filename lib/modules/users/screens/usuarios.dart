import 'package:flutter/material.dart';
import 'package:my_flutter_app/modules/users/services/usuarios_service.dart';

import '../models/usuario_model.dart';

class Usuarios extends StatefulWidget {

  const Usuarios({super.key});

  @override
  State<Usuarios> createState() {
    return UsuariosState();
  }
}

class UsuariosState extends State<Usuarios> {
  /// Lista de objetos da classe Usuario
  List<Usuario> _lista = [];
  UsuariosService service = UsuariosService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Usuários")),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text("Adicionar usuário"),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Novo usuário'),
                  content: const Text('Formulário'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, 'Cadastrar');
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ],
                ),
              ).then((value) {
                print(value);
              });
            }
          ),
          FutureBuilder<List<Usuario>>(
            future: service.getAll(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState==ConnectionState.done && snapshot.hasData) {
                _lista = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
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
              // Deu algum erro
              if (snapshot.hasError) {
                print(snapshot.error);
                return const Center(
                  child: Text("Erro ao carregar dados")
                );
              }
              return const Center(
                child: Text("Listagem de usuários.")
              );
            }
          )
        ],
      )
    );
  }

}