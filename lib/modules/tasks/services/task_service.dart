import '../models/task.dart';
import '../repositories/abstract_task_repository.dart';
import '../repositories/database_task_repository.dart';
import '../repositories/mock_task_repository.dart';

class TaskService {

  late AbstractTaskRepository repository;

  TaskService() {
    repository = DatabaseTaskRepository();
  }


  void store(Task task) {
    repository.store(task);
  }

  Future<List<Task>> getAll() async {
    return repository.getAll();
  }

}