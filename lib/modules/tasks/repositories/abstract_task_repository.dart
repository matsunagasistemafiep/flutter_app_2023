import '../models/task.dart';

abstract class AbstractTaskRepository {

  Future<List<Task>> getAll();

  Future<void> store(Task task);

}