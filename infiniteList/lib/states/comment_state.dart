import 'package:equatable/equatable.dart';
import 'package:infiniteList/events/comment_event.dart';
import 'package:infiniteList/models/comment.dart';

class CommentState extends Equatable {
  const CommentState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CommentStateInitial extends CommentState {}

class CommentStateFailure extends CommentState {}

class CommentStateSuccess extends CommentState {
  final List<Comment> comments;
  final bool hasReachedEnd;
  const CommentStateSuccess({this.comments, this.hasReachedEnd});
  @override
  String toString() => "comments : $comments, hasReachedEnd: $hasReachedEnd";
  @override
  // TODO: implement props
  List<Object> get props => [comments, hasReachedEnd];
  CommentStateSuccess cloneWith({List<Comment> comments, bool hasReachedEnd}) {
    return CommentStateSuccess(
      comments: comments ?? this.comments,
      hasReachedEnd: hasReachedEnd?? this.hasReachedEnd
    );
  }
}
