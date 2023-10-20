// ignore_for_file: unused_import

import '../models/task.dart';
import '../repositories/abstract_task_repository.dart';
import '../repositories/database_task_repository.dart';
import '../repositories/mock_task_repository.dart';

class TaskService {

  late AbstractTaskRepository repository;

  TaskService() {
    //repository = MockTaskRepository();
    repository = DatabaseTaskRepository();
  }


  Future<void> store(Task task) async {
    repository.store(task);
  }

  Future<List<Task>> getAll() async {
    return repository.getAll();
  }

  Future<void> update(Task task) async {
    repository.update(task.id, task);
  }

  Future<void> delete(String id) async {
    repository.delete(id);
  }

}