import 'package:flutter/material.dart';

class ListaTarefas extends StatefulWidget {
  @override
  State<ListaTarefas> createState() {
    return ListaTarefasState();
  }
}

class ListaTarefasState extends State<ListaTarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Minhas tarefas")),
      body: Container()
    );
  }
}