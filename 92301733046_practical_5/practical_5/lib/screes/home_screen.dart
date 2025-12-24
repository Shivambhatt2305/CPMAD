import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';
import '../widgets/add_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Todo> _todos = [];
  int _idCounter = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _addTodo(String title) {
    setState(() {
      _todos.add(Todo(id: _idCounter++, title: title));
    });
  }

  void _toggleTodoCompletion(int id) {
    setState(() {
      final todo = _todos.firstWhere((t) => t.id == id);
      todo.isCompleted = !todo.isCompleted;
    });
  }

  void _deleteTodo(int id) {
    setState(() {
      _todos.removeWhere((t) => t.id == id);
    });
  }

  List<Todo> _getFilteredTodos(String filter) {
    if (filter == 'all') return _todos;
    if (filter == 'pending') {
      return _todos.where((t) => !t.isCompleted).toList();
    } else {
      return _todos.where((t) => t.isCompleted).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Pending'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Column(
        children: [
          AddTodo(onAdd: _addTodo),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTodoList('all'),
                _buildTodoList('pending'),
                _buildTodoList('completed'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoList(String filter) {
    final filteredTodos = _getFilteredTodos(filter);
    if (filteredTodos.isEmpty) {
      return const Center(child: Text('No todos found.'));
    }
    return ListView.builder(
      itemCount: filteredTodos.length,
      itemBuilder: (context, index) {
        final todo = filteredTodos[index];
        return TodoItem(
          todo: todo,
          onToggle: _toggleTodoCompletion,
          onDelete: _deleteTodo,
        );
      },
    );
  }
}
