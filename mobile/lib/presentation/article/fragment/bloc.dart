import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/domain/entity/article.dart';

class ArticleBloc extends ScrollFragmentBloc<Article> {
  @override
  ScrollFragmentState<Article> get initialState => ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Article>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      await Future.delayed(Duration(seconds: 2));
      items.addAll([
        Article.mock,
        Article.mock,
        Article.mock,
        Article.mock,
      ]);
      yield ScrollFragmentState(items);
    } else if (event is Add<Article>) {
      items.add(event.item);
      yield ScrollFragmentState(items);
    }
  }
}
