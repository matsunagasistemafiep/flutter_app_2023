import 'package:cadastro_tasks/modules/tasks/widgets/list_task.dart';
import 'package:flutter/material.dart';
import '../widgets/form_task.dart';

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({super.key});

  @override
  State<ListaTarefas> createState() {
    return ListaTarefasState();
  }
}

class ListaTarefasState extends State<ListaTarefas> {
  refresh() {
    print("Atualizando a tela");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Minhas tarefas")),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            FormTask(update: refresh),
            const Divider(), // Linha horizontal
            const ListTask()
          ]
        ))
    );
  }

  

}