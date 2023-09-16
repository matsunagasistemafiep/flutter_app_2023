import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/tarefa_model.dart';

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

  List<Tarefa> listaTarefa = [];

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
                labelText: "Descrição",
                icon: Icon(Icons.description)
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
            ElevatedButton(
              child: const Text("Cadastrar"),
              onPressed: () {
                /// Instanciar um objeto da classe Tarefa
                Tarefa task = Tarefa(
                  id: listaTarefa.length+1,
                  descricao: descriptionControl.text,
                  data: dataControl.text,
                  hora: horaControl.text
                );
                setState(() {
                  listaTarefa.add(task);
                });
              },
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: listaTarefa.length,
                itemBuilder: (context, index) {
                  Tarefa task = listaTarefa[index];
                  return ListTile(
                    leading: const Icon(Icons.task),
                    title: Text(task.descricao),
                    subtitle: Text("${task.data} às ${task.hora}"),
                  );
                },
              ),
            )
          ]
        ))
    );
  }
}