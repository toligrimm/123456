import 'package:dismiss/repos/repo.dart';
import '../todo.dart';

class TodoService{
  Repository _repository;

  TodoService(){
    _repository = Repository();

  }
  saveTodo(Todo todo) async{
   return await _repository.insertData('todolists', todo.todoMap());

  }
}