import 'package:demo/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = NotifierProvider<TodoListNotifier, List<Todo>>(() {
  return TodoListNotifier();
});

class TodoListNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return [];
  }

  void addTodo(String content) {
    state = [
      ...state,
      Todo(
        todoId: state.isEmpty ? 0 : state[state.length - 1].todoId + 1,
        content: content,
        completed: false,
      )
    ];
  }

  void completeTodo(int id) {
    state = [
      for (final todo in state)
        if (todo.todoId == id)
          Todo(
            todoId: todo.todoId,
            content: todo.content,
            completed: true,
          )
        else
          todo,
    ];
  }

  void deleteTodo(int id) {
    state = state.where((todo) => todo.todoId != id).toList();
  }
}
