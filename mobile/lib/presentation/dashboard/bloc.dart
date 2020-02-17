import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpati/data/firebase/config_repository.dart';
import 'package:simpati/data/firebase/person_meta_repository.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/domain/entity/recap.dart';
import 'package:simpati/domain/repository/config_repository.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';
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

  DashboardBloc({
    IConfigRepository configRepository,
    IPersonMetaRepository metaRepository,
  }) : this._loadMetaUsecase = LoadMetaUsecase(
          configRepository ?? ConfigRepository(),
          metaRepository ?? PersonMetaRepository(),
        );

  @override
  DashboardState get initialState => state;

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event == DashboardEvent.Init) {
      final motherMeta = await _loadMetaUsecase.start(MetaUsecase.Mother);
      final childMeta = await _loadMetaUsecase.start(MetaUsecase.Child);

      // TODO: handle error

      final newState = DashboardState(
        motherMeta: motherMeta.data,
        childMeta: childMeta.data,
      );
      yield newState;

      // set new data
      state = newState;
    }
  }
}
