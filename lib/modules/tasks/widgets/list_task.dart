
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/task_service.dart';
import 'detalhes_tarefa.dart';

class ListTask extends StatefulWidget {
  const ListTask({super.key});

  @override
  State<ListTask> createState() {
    return _ListTask();
  }
}

class _ListTask extends State<ListTask> {

  TaskService service = TaskService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Task>>(
      // Determinar qual dado vai ser requisitado
      future: service.getAll(),
      // Quando foi requisitar a informação (future), pode levar um tempo
      // por isso, a cada momento terá um snapshot
      builder: (context, snapshot) {
        // Ainda está esperando pelo retorno
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        // Quando retornar os dados
        if (snapshot.connectionState==ConnectionState.done 
            && snapshot.hasData) {
          List<Task> listaTarefa = snapshot.data!;
          print(listaTarefa);
          return Expanded(
            /// listaTarefa - a lista em si
            /// index - o índice da lista
            /// listaTarefa[index] - item atual
            child: ListView.builder(
              itemCount: listaTarefa.length,
              itemBuilder: (context, index) {
                Task task = listaTarefa[index];
                return ListTile(
                  // Operador condicional ternário
                  leading: (task.situacao==1) ? 
                    const Icon(Icons.check_circle, color: Color.fromARGB(255, 76, 249, 82))
                    : const Icon(Icons.warning, color: Colors.amber),
                  title: Text(
                    task.descricao,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    )
                  ),
                  subtitle: Text("${task.data} às ${task.hora}"),
                  trailing: (task.situacao==0) ? 
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.blueAccent),
                      onPressed:() {
                        setState(() {
                          listaTarefa[index].situacao = 1;
                        });
                      },
                    ) :
                    IconButton(
                      icon: const Icon(Icons.undo_rounded, color: Colors.redAccent),
                      onPressed:() {
                        setState(() {
                          listaTarefa[index].situacao = 0;
                        });
                      },
                    ),
                  onLongPress: () {
                    print("Ação on Long Press");
                    /*Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder:(context) => DetalhesTarefa(task: listaTarefa[index]),
                      )
                    );*/
                    showModalBottomSheet(
                      context: context, 
                      builder: (context) {
                        return DetalhesTarefa(task: listaTarefa[index]);
                      },
                    );
                  },  
                  onTap: () {
                    print("Ação Tap");
                  },
                );
              },
            ),
          );
        }

        return Container();
      }
    );

    
  }

}