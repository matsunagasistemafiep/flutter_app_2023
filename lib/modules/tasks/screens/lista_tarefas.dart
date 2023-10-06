import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';
import '../widgets/detalhes_tarefa.dart';

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({super.key});

  @override
  State<ListaTarefas> createState() {
    return ListaTarefasState();
  }
}

class ListaTarefasState extends State<ListaTarefas> {

  TextEditingController descriptionControl = TextEditingController();
  TextEditingController dataControl = TextEditingController();
  TextEditingController horaControl = TextEditingController();
  TextEditingController detalhesControl = TextEditingController();

  /// Variável que representa os dados a serem exibidos
  List<Task> listaTarefa = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Minhas tarefas")),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: descriptionControl,
              decoration: const InputDecoration(
                labelText: "Título",
                icon: Icon(Icons.task)
              )
            ),
            TextFormField(
              controller: dataControl,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Data da tarefa",
                icon: Icon(Icons.calendar_month)
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2030)
                );
                if (pickedDate!=null) {
                  String dataFormatada = DateFormat('dd/MM/yyyy').format(pickedDate);
                  setState(() {
                    dataControl.text = dataFormatada;
                  });
                }
              }
            ),
            TextFormField(
              controller: horaControl,
              readOnly: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.av_timer),
                labelText: "Hora da tarefa"
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now()
                );
                if (pickedTime!=null) {
                  setState(() {
                    horaControl.text = "${pickedTime.hour}:${pickedTime.minute}";
                  });
                }
              },
            ),
            TextFormField(
              controller: detalhesControl,
              decoration: const InputDecoration(
                icon: Icon(Icons.description),
                labelText: "Detalhes da tarefa"
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            /// Botão responsável por cadastrar uma nova tarefa
            ElevatedButton(
              style: ButtonStyle(
                // MediaQuery.of(context).size.width é a largura da tela do celular
                // *0.75 indica que é 75% da largura
                fixedSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width*0.75, 50)),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                backgroundColor: const MaterialStatePropertyAll(Colors.greenAccent)
              ),
              child: const Text("Cadastrar"),
              onPressed: () {
                /// Instanciar um objeto da classe Tarefa
                Task task = Task(
                  id: listaTarefa.length+1,
                  descricao: descriptionControl.text,
                  data: dataControl.text,
                  hora: horaControl.text,
                  detalhes: detalhesControl.text
                );
                setState(() {
                  listaTarefa.add(task);
                });
              },
            ),
            const Divider(),
            Expanded(
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
            )
          ]
        ))
    );
  }
}