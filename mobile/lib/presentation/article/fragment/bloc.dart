import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/data/firebase/article_repository.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/domain/repository/article_repository.dart';
import 'package:simpati/domain/usecase/load_article_usecase.dart';

class ArticleBloc extends ScrollFragmentBloc<Article> {
  final LoadArticleUsecase _loadArticleUsecase;

  ArticleBloc({
    IArticleRepository articleRepository,
  }) : this._loadArticleUsecase = LoadArticleUsecase(
          articleRepository ?? ArticleRepository(),
        );

  @override
  ScrollFragmentState<Article> get initialState => ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Article>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      final articleResult = await _loadArticleUsecase.start(-1); // load all
      items.addAll(articleResult.data.articles);
      yield ScrollFragmentState(items);
    } else if (event is Add<Article>) {
      items.add(event.item);
      yield ScrollFragmentState(items);
    }
  }
}
