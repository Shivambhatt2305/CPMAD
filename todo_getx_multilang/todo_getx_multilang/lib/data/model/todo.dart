class Todo {
  String id;
  String title;
  bool done;

  Todo({required this.id, required this.title, this.done = false});

  factory Todo.fromJson(Map<String, dynamic> j) =>
      Todo(id: j['id'], title: j['title'], done: j['done'] ?? false);

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'done': done};
}
