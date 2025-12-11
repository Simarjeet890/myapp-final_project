class Task {
  final String id;
  final String name;
  final bool completed;

  Task({required this.id, required this.name, required this.completed});

  factory Task.fromMap(String id, Map<String, dynamic> data) {
    return Task(
      id: id,
      name: data['name'] ?? '',
      completed: data['completed'] ?? false,
    );
  }
}

//According to my view point it describes a task with id and the name. also it helps to complete the status.//
