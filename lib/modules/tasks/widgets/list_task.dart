
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/task_service.dart';
import 'detalhes_tarefa.dart';

class ListTask extends StatefulWidget {

  final List<Task> tasks;
  final Function esconderForms;
  final Function mostrarForms;

  const ListTask({
    super.key, 
    required this.tasks,
    required this.esconderForms,
    required this.mostrarForms
  });

  @override
  State<ListTask> createState() {
    return _ListTask();
  }
}

class _ListTask extends State<ListTask> {

  TaskService service = TaskService();
  /// Cria um controller para scroll da tela
  final ScrollController _scroll = ScrollController();

  @override
  void initState() {
    _scroll.addListener(_scrollListener);
    super.initState();
  }

  /// Capturando eventos quando o scroll é ativado
  _scrollListener() {
    if (_scroll.offset>0.0) {
      print("Scroll ${_scroll.offset}");
      // Faz uma execução de uma função remota
      widget.esconderForms();
    }
    else {
      if (_scroll.offset==0.0) {
          widget.mostrarForms();
        }
    }

  }

  @override
  Widget build(BuildContext context) {

    List<Task> listaTarefa = widget.tasks;

    return Expanded(
      /// listaTarefa - a lista em si
      /// index - o índice da lista
      /// listaTarefa[index] - item atual
      child: ListView.builder(
        controller: _scroll,
        itemCount: listaTarefa.length,
        itemBuilder: (context, index) {
          Task task = listaTarefa[index];
          return Dismissible(
            key: Key(task.id),
            onDismissed:(direction) {
              // Remove a task do banco de dados
              service.delete(task.id);
              // Mostra uma mensagem de notificação.
              ScaffoldMessenger.of(context)
                .showSnackBar(
                  const SnackBar(content: Text("Task removido com sucesso!"))
                );
            },
            background: Container(color: Colors.redAccent),
            child: 
              ListTile(
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
                        service.update(listaTarefa[index]);
                      });
                    },
                  ) :
                  IconButton(
                    icon: const Icon(Icons.undo_rounded, color: Colors.redAccent),
                    onPressed:() {
                      setState(() {
                        listaTarefa[index].situacao = 0;
                        service.update(listaTarefa[index]);
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
              )
          );
        },
      ),
    );    
  }

}