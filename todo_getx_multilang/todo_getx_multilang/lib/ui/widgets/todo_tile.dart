import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../contorller/todo_controller.dart';
import '../../data/model/todo.dart';
import '../../routes/app_routes.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<TodoController>();
    return Dismissible(
      key: Key(todo.id),
      background: Container(color: Colors.redAccent),
      onDismissed: (_) => c.remove(todo.id),
      child: CheckboxListTile(
        value: todo.done,
        title: Text(
          todo.title,
          style: todo.done
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        onChanged: (_) => c.toggle(todo.id),
        secondary: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => Get.toNamed(
            Routes.ADD_EDIT,
            arguments: {'id': todo.id, 'title': todo.title},
          ),
        ),
      ),
    );
  }
}
