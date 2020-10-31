import 'dart:convert';

import 'package:infiniteList/models/comment.dart';
import 'package:http/http.dart' as http;

import '../models/comment.dart';

Future<List<Comment>> getCommentsFromApi(int start, int limit) async {
  final url =
      "https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit";
  final http.Client httpClient = http.Client();
  try {
    final respone = await httpClient.get(url);
    if (respone.statusCode == 200) {
      final responseData = json.decode(respone.body) as List;
      final List<Comment> comments = responseData.map((comment) {
        return Comment(
          id: comment['id'],
          name: comment['name'],
          email: comment['email'],
          body: comment['body'],
        );
      }).toList();
      print('x');
      return comments;
    } else
      return List<Comment>();
  } catch (e) {
    print(e.toString());
    return List<Comment>();
  }
}
