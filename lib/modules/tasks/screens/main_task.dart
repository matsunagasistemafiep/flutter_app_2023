import 'package:cadastro_tasks/modules/tasks/services/task_service.dart';
import 'package:cadastro_tasks/modules/tasks/widgets/list_task.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/form_task.dart';

class MainTask extends StatefulWidget {
  const MainTask({super.key});

  @override
  State<MainTask> createState() {
    return _MainTask();
  }
}

class _MainTask extends State<MainTask> {

  TaskService service = TaskService();

  refresh() {
    print("Atualizando a tela");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: const Text("Minhas tarefas")),
      body: FutureBuilder<List<Task>>(
        future: service.getAll(),
        builder: (context, snapshot) {
          // Ainda está esperando pelo retorno
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.connectionState==ConnectionState.done && snapshot.hasData) {
            List<Task> lista = snapshot.data!;
            return Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  FormTask(update: refresh),
                  const Divider(), // Linha horizontal
                  ListTask(tasks: lista)
                ]
              )
            );
          }
          // Deu algum erro
          if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao carregar dados")
            );
          }
          return const Center(
            child: Text("Listagem de tarefas.")
          );
        }
      )
    );

  }

  

}