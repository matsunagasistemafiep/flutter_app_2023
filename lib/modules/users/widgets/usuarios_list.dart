import 'package:flutter/material.dart';
import 'package:my_flutter_app/modules/users/services/usuarios_service.dart';

import '../models/usuario_model.dart';

class UsuariosList extends StatefulWidget {
  final UsuariosService service;
  const UsuariosList({ Key? key, required this.service }) : super(key: key);

  @override
  State<UsuariosList> createState() => _UsuariosListState();
}

class _UsuariosListState extends State<UsuariosList> {
  List<Usuario> _lista = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Usuario>>(
      future: widget.service.getAll(),
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
                  title: Text(
                    "${_lista[index].nome} (${(DateTime.now().difference(_lista[index].dataNascimento).inDays/365).ceil()} anos)"
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(child: Icon(Icons.email)),
                            TextSpan(text: " ${_lista[index].email}"),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(child: Icon(Icons.phone)),
                            TextSpan(text: " ${_lista[index].telefone}"),
                          ],
                        ),
                      ),
                    ],
                  )
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
    );
  }
}