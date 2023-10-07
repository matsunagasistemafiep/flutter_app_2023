
import 'dart:math';

import 'package:cadastro_tasks/modules/tasks/styles/styles_task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';
import '../services/task_service.dart';

class FormTask extends StatefulWidget {

  final Function update;

  const FormTask({super.key, required this.update});
  
  @override
  State<FormTask> createState() {
    return _FormTask();
  }

}

class _FormTask extends State<FormTask> {
  /* Instância do service para o módulo - requisição de dados e ações */
  TaskService service = TaskService();

  /* Define ponteiros para os focos de cada formulário 
  Será útil para desfazer o foco quando necessário
  */
  FocusNode descFocusNode = FocusNode();
  FocusNode detFocusNode = FocusNode();

  /* Controllers de cada item de formulário */
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
          focusNode: descFocusNode,
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
          focusNode: detFocusNode,
          decoration: const InputDecoration(
            icon: Icon(Icons.description),
            labelText: "Detalhes da tarefa"
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 10),
        /// Botão responsável por cadastrar uma nova tarefa
        ElevatedButton(
          style: StylesTask.buttonStyle(MediaQuery.of(context).size.width*0.75),
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
              service.store(task).then((value) => {
                widget.update()
              });
            });
          },
        )
      ],
    );
  }

}
