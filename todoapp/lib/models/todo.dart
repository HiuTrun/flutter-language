class ToDo {
  int _id;
  String _content;

  ToDo.fromData(id, content) {
    this._id = id;
    this._content = content;
  }

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get content => _content;
  set content(String value) {
    _content = value;
  }
}
