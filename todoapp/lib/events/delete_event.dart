import '../base/base_event.dart';
import '../models/todo.dart';

class DeleteEvent extends BaseEvent {
  ToDo todo;
  DeleteEvent(this.todo);
}
