
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';
import '../services/task_service.dart';

class FormTask extends StatefulWidget {

  const FormTask({super.key});
  
  @override
  State<FormTask> createState() {
    return _FormTask();
  }

}

class _FormTask extends State<FormTask> {

  TaskService service = TaskService();


  TextEditingController descriptionControl = TextEditingController();
  TextEditingController dataControl = TextEditingController();
  TextEditingController horaControl = TextEditingController();
  TextEditingController detalhesControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
            var uuid = Random().nextInt(4294967296).toString();
            //print(uuid);
            Task task = Task(
              id: uuid,
              descricao: descriptionControl.text,
              data: dataControl.text,
              hora: horaControl.text,
              detalhes: detalhesControl.text
            );
            setState(() {
              //listaTarefa.add(task);
              service.store(task);
            });
          },
        )
      ],
    );
  }

}
