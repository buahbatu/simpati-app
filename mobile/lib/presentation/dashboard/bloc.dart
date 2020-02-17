import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/domain/entity/recap.dart';

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

  @override
  DashboardState get initialState => state;

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event == DashboardEvent.Init) {
      // items.add(event.item);
      // yield ScrollFragmentState(items);
    }
  }
}
