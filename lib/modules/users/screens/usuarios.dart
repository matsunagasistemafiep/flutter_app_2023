import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_app/modules/users/widgets/usuarios_list.dart';

import '../models/usuario_model.dart';
import '../services/usuarios_service.dart';

class Usuarios extends StatefulWidget {

  const Usuarios({super.key});

  @override
  State<Usuarios> createState() {
    return UsuariosState();
  }
}

class UsuariosState extends State<Usuarios> {
  TextEditingController nomeControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController telefoneControl = TextEditingController();
  TextEditingController dataControl = TextEditingController();
  DateTime dataSelecionada = DateTime.now();
  UsuariosService usuarioService = UsuariosService();

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
              showDialog<Usuario>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Novo usuário'),
                  content: Column(
                    children: [
                      TextFormField(
                        controller: nomeControl,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "Nome",
                          icon: Icon(Icons.person)
                        )
                      ),
                      TextFormField(
                        controller: emailControl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "E-mail",
                          icon: Icon(Icons.email)
                        )
                      ),
                      TextFormField(
                        controller: telefoneControl,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: "Telefone",
                          icon: Icon(Icons.phone)
                        )
                      ),
                      TextFormField(
                        controller: dataControl,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Data de nascimento",
                          icon: Icon(Icons.calendar_month)
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: dataSelecionada,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            currentDate: dataSelecionada
                          );
                          if (pickedDate!=null) {
                            setState(() {
                              String dataFormatada = DateFormat('dd/MM/yyyy').format(pickedDate);
                              dataSelecionada = pickedDate;
                              dataControl.text = dataFormatada;
                            });
                          }
                        }
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String urlFoto = "https://i.pravatar.cc/300?img=${Random().nextInt(71)}";
                        Usuario usuario = Usuario(
                          nome: nomeControl.text, urlFoto: urlFoto, dataNascimento: dataSelecionada,
                          email: emailControl.text, telefone: telefoneControl.text
                        );
                        Navigator.pop(context, usuario);
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ],
                ),
              ).then((value) {
                if (value!=null) {
                  setState(() {
                    usuarioService.store(value);
                  });
                }
              });
            }
          ),
          UsuariosList(service: usuarioService)
        ],
      )
    );
  }

}