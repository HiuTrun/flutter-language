import '../base/base_event.dart';

class AddEvent extends BaseEvent {
  String content;
  AddEvent(this.content);
}
