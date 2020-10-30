import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blocs/todo_bloc.dart';
import 'blocs/todo_bloc.dart';
import 'blocs/todo_bloc.dart';
import 'blocs/todo_bloc.dart';
import 'events/add_event.dart';
import 'events/delete_event.dart';
import 'widgets/todo_listview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("To Do"),
          centerTitle: true,
        ),
        body: Provider<ToDoBloc>.value(
          value: ToDoBloc(),
          child: ToDoListContainer(),
        ),
      ),
    );
  }
}

class ToDoListContainer extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ToDoBloc>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      hintText: "Write something down", labelText: "Add"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton.icon(
                onPressed: () {
                  print('onPressed');
                  bloc.event.add(AddEvent(_textEditingController.text));
                },
                icon: Icon(Icons.add),
                label: Text('Add'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ToDoListView(),
        ],
      ),
    );
  }
}
