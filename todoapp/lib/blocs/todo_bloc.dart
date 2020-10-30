import 'dart:async';
import 'dart:math';
import 'package:todoapp/base/base_bloc.dart';
import 'package:todoapp/base/base_event.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/events/add_event.dart';
import 'package:todoapp/events/delete_event.dart';

class ToDoBloc extends BaseBloc {
  StreamController<List<ToDo>> _todoListStreamController =
      StreamController<List<ToDo>>();
  Stream<List<ToDo>> get TodoListStream => _todoListStreamController.stream;

  List<ToDo> _todoListData = List<ToDo>();
  var _random = Random();
  _addToDo(ToDo todo) {
    print("add function");
    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteToDo(ToDo todo) {
    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    print("dispatch function in BlocToDo");
    // TODO: implement dispatchEvent
    if (event is AddEvent) {
      ToDo todo = ToDo.fromData(_random.nextInt(10000), event.content);
      _addToDo(todo);
    } else if (event is DeleteEvent) {
      _deleteToDo(event.todo);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _todoListStreamController.close();
    super.dispose();
  }
}
