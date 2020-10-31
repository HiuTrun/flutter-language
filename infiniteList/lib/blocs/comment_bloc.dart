import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infiniteList/events/comment_event.dart';
import 'package:infiniteList/services/service.dart';
import 'package:infiniteList/states/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final NUMBER_OF_COMMENTS_PER_PAGE = 20;

  CommentBloc() : super(CommentStateInitial());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    try {
      final hasReachedEndOfOnePage = (state is CommentStateSuccess &&
          (state as CommentStateSuccess).hasReachedEnd);
      if (event is CommentFetchedEvent && !hasReachedEndOfOnePage) {
        if (state is CommentStateInitial) {
          final comments =
              await getCommentsFromApi(0, NUMBER_OF_COMMENTS_PER_PAGE);
          yield CommentStateSuccess(comments: comments, hasReachedEnd: false);
        } else if (state is CommentStateSuccess) {
          int finalIndexOfCurrentPage =
              (state as CommentStateSuccess).comments.length;
          final comments = await getCommentsFromApi(
              finalIndexOfCurrentPage, NUMBER_OF_COMMENTS_PER_PAGE);
          if (comments.isEmpty) {
            yield (state as CommentStateSuccess).cloneWith(hasReachedEnd: true);
          } else {
            yield CommentStateSuccess(
                comments: (state as CommentStateSuccess).comments + comments,
                hasReachedEnd: false);
          }
        }
      }
    } catch (exception) {
      yield CommentStateFailure();
    }
  }
}
