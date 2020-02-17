import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpati/data/firebase/article_repository.dart';
import 'package:simpati/data/firebase/config_repository.dart';
import 'package:simpati/data/firebase/person_meta_repository.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/domain/entity/recap.dart';
import 'package:simpati/domain/repository/article_repository.dart';
import 'package:simpati/domain/repository/config_repository.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';
import 'package:simpati/domain/usecase/load_article_usecase.dart';
import 'package:simpati/domain/usecase/load_meta_usecase.dart';

enum DashboardEvent { Init }

class DashboardState extends Equatable {
  final PersonMeta motherMeta;
  final PersonMeta childMeta;
  final List<Article> articles;

  DashboardState({this.motherMeta, this.childMeta, this.articles});

  DashboardState copyWith({
    PersonMeta motherMeta,
    PersonMeta childMeta,
    List<Article> articles,
  }) {
    return DashboardState(
      motherMeta: motherMeta ?? this.motherMeta,
      childMeta: childMeta ?? this.childMeta,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object> get props => [this.motherMeta, this.childMeta, this.articles];
}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardState state = DashboardState();

  final LoadMetaUsecase _loadMetaUsecase;
  final LoadArticleUsecase _loadArticleUsecase;

  DashboardBloc({
    IConfigRepository configRepository,
    IPersonMetaRepository metaRepository,
    IArticleRepository articleRepository,
  })  : this._loadMetaUsecase = LoadMetaUsecase(
          configRepository ?? ConfigRepository(),
          metaRepository ?? PersonMetaRepository(),
        ),
        this._loadArticleUsecase = LoadArticleUsecase(
          articleRepository ?? ArticleRepository(),
        );

  @override
  DashboardState get initialState => state;

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event == DashboardEvent.Init) {
      final motherMeta = await _loadMetaUsecase.start(MetaUsecase.Mother);
      // TODO: handle error

      final momState = DashboardState(
        motherMeta: motherMeta.data,
      );
      yield momState;
      state = momState;

      final childMeta = await _loadMetaUsecase.start(MetaUsecase.Child);
      // TODO: handle error

      final momChildState = DashboardState(
        motherMeta: motherMeta.data,
        childMeta: childMeta.data,
      );
      yield momChildState;
      state = momChildState;

      final articleResult = await _loadArticleUsecase.start(3);
      // TODO: handle error

      final completeState = DashboardState(
        motherMeta: motherMeta.data,
        childMeta: childMeta.data,
        articles: articleResult.data.articles,
      );
      yield completeState;
      state = completeState;
    }
  }
}
