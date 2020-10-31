import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infiniteList/blocs/comment_bloc.dart';
import 'package:infiniteList/events/comment_event.dart';
import 'infinite_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context)=> CommentBloc()..add(CommentFetchedEvent()),
        child: InfiniteList(),
      ),
    );
  }
}
