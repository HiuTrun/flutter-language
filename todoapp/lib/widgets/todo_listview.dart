import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/todo_bloc.dart';
import '../events/delete_event.dart';
import '../models/todo.dart';

class ToDoListView extends StatefulWidget {
  @override
  _ToDoListViewState createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ToDoBloc>(
          builder: (context, bloc, child) => StreamBuilder<List<ToDo>>(
              stream: bloc.TodoListStream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data[index].content),
                            trailing: GestureDetector(
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onTap: () {
                                bloc.event
                                    .add(DeleteEvent(snapshot.data[index]));
                              },
                            ),
                          );
                        });
                  case ConnectionState.waiting:
                    return Center(
                        child: Container(
                      width: 70,
                      height: 70,
                      child: Text("Empty "),
                    ));
                  case ConnectionState.none:
                  default:
                    return Center(
                        child: Container(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(),
                    ));
                }
              })),
    );
  }
}
