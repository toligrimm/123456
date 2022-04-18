import 'package:dismiss/service/todoservice.dart';
import 'package:flutter/material.dart';

import '../todo.dart';

class Todolist extends StatefulWidget {
  const Todolist({Key? key}) : super(key: key);

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  final _todoNameController = TextEditingController();
  final _todoDescriptionController = TextEditingController();

  final _todo = Todo();
  final _todoService = TodoService();

  Future<void> _showFormDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _todoNameController,
                  decoration: const InputDecoration(
                    hintText: 'Введите значение',
                    labelText: 'Название',
                  ),
                ),
                TextField(
                  controller: _todoDescriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Введите значение',
                    labelText: 'Описание',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Добавить'),
              onPressed: () {
                _todo.name = _todoNameController.text;
                _todo.description = _todoDescriptionController.text;
                _todoService.saveTodo(_todo);
              },
            ),
            TextButton(
              child: const Text('Отменить'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showFormDialog(context);
        },
        child: const Icon(Icons.add),),
    );
  }
}
