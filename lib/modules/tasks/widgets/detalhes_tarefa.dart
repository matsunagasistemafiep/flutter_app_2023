import 'package:flutter/material.dart';

import '../models/task.dart';

class DetalhesTarefa extends StatelessWidget {
  
  final Task task;

  const DetalhesTarefa({
    super.key,
    required this.task
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.descricao),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(task.detalhes)
          ],
        )
      )
    );
  }

}