
import 'package:cadastro_tasks/modules/tasks/models/task.dart';

import 'abstract_task_repository.dart';

class MockTaskRepository extends AbstractTaskRepository {

  @override
  Future<List<Task>> getAll() async {
    return [
      Task(id: "1", descricao: "descricao", data: "data", hora: "hora", detalhes: "detalhes")
    ] as Future<List<Task>>;
  }

  @override
  Future<void> store(Task task) async {
    print("Armazenando dados da task " + task.toString());
  }
  
}