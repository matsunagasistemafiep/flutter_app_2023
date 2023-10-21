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

  bool mostrarForms = true;

  refresh() {
    print("Atualizando a tela");
    setState(() {});
  }

  esconder() {
    if (mostrarForms) {
      setState(() {
        mostrarForms = false;
      });
    }
  }

  mostrar() {
    if (!mostrarForms) {
      setState(() {
        mostrarForms = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: const Text("Minhas tarefas")),
      body: FutureBuilder<List<Task>>(
        future: service.getAll(), // Requisição assíncrona
        // snapshot: estado atual da requisição
        builder: (context, snapshot) {
          // Ainda está esperando pelo retorno
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState==ConnectionState.done && snapshot.hasData) {
            List<Task> lista = snapshot.data!;
            return Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Visibility(
                    visible: mostrarForms,
                    child: FormTask(update: refresh)
                  ),
                  const Divider(), // Linha horizontal
                  ListTask(
                    tasks: lista, 
                    esconderForms: esconder,
                    mostrarForms: mostrar
                  )
                ]
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
            child: Text("Listagem de tarefas.")
          );
        }
      )
    );

  }

  

}