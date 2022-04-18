// import 'package:flutter/material.dart';
//
// import '../todo.dart';
//
// class TodoDialog extends StatefulWidget {
//   const TodoDialog(BuildContext context, {Key? key}) : super(key: key);
//
//   @override
//   State<TodoDialog> createState() => _TodoDialogState();
// }
//
// class _TodoDialogState extends State<TodoDialog> {
//   final controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Новое'),
//       content: TextFormField(
//         controller: controller,
//         autofocus: true,
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: const Text('Отменить'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         TextButton(
//           child: const Text('Добавить'),
//           onPressed: () {
//             final todo = Todo(title: controller.value.text);
//             controller.clear();
//             Navigator.of(context).pop(todo);
//           },
//         ),
//       ],
//     );
//   }
// }
