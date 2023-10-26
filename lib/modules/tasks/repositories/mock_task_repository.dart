
import 'package:my_flutter_app/modules/tasks/models/task.dart';

import 'abstract_task_repository.dart';

class MockTaskRepository extends AbstractTaskRepository {

  List<Task> mockList = [];

  MockTaskRepository() {
    mockList = [
      Task(id: "1", descricao: "descricao 1", data: "07/10/2023", hora: "8:30", detalhes: "detalhes"),
      Task(id: "2", descricao: "descricao 2", data: "07/10/2023", hora: "8:30", detalhes: "detalhes")
    ];
  }

  @override
  Future<List<Task>> getAll() async {
    return Future.value(mockList);
  }

  @override
  Future<void> store(Task task) async {
    print("Armazenando dados da task " + task.toString());
    mockList.add(task);
  }
  
  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future<void> update(String id, Task task) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}