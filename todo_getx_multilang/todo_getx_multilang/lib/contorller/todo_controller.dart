import 'dart:convert';
import 'package:get/get.dart';
import '../data/model/todo.dart';
import '../services/storage_service.dart';

class TodoController extends GetxController {
  final RxList<Todo> todos = <Todo>[].obs;

  @override
  void onInit() {
    _load();
    super.onInit();
  }

  void _load() {
    final raw = StorageService.read<String>(StorageService.keyTodos);
    if (raw != null && raw.isNotEmpty) {
      final List list = jsonDecode(raw);
      todos.assignAll(list.map((e) => Todo.fromJson(e)).toList());
    }
  }

  Future<void> _save() async {
    final encoded = jsonEncode(todos.map((e) => e.toJson()).toList());
    await StorageService.write(StorageService.keyTodos, encoded);
  }

  Future<void> add(String title) async {
    if (title.trim().isEmpty) return;
    todos.add(Todo(id: DateTime.now().microsecondsSinceEpoch.toString(), title: title.trim()));
    await _save();
  }

  Future<void> updateTitle(String id, String newTitle) async {
    final i = todos.indexWhere((t) => t.id == id);
    if (i != -1) {
      todos[i] = Todo(id: todos[i].id, title: newTitle.trim(), done: todos[i].done);
      await _save();
    }
  }

  Future<void> toggle(String id) async {
    final i = todos.indexWhere((t) => t.id == id);
    if (i != -1) {
      todos[i] = Todo(id: todos[i].id, title: todos[i].title, done: !todos[i].done);
      await _save();
    }
  }

  Future<void> remove(String id) async {
    todos.removeWhere((t) => t.id == id);
    await _save();
  }

  Future<void> clearCompleted() async {
    todos.removeWhere((t) => t.done);
    await _save();
  }
}
