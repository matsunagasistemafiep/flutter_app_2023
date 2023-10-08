
import 'package:flutter/material.dart';

import '../models/task.dart';
import 'detalhes_tarefa.dart';

class ListTask extends StatefulWidget {

  final List<Task> tasks;

  const ListTask({super.key, required this.tasks});

  @override
  State<ListTask> createState() {
    return _ListTask();
  }
}

class _ListTask extends State<ListTask> {

  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Task> listaTarefa = widget.tasks;

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

}