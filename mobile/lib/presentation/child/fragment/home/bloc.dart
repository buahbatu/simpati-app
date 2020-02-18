import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/data/firebase/child_repository.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';
import 'package:simpati/domain/usecase/load_child_usecase.dart';

class ChildBloc extends ScrollFragmentBloc<Child> {
  final LoadChildUsecase _loadChildUsecase;

  ChildBloc({
    IPosyanduRepository posyanduRepositoryPref,
    IChildRepository childRepository,
  }) : this._loadChildUsecase = LoadChildUsecase(
          posyanduRepositoryPref ?? PosyanduRepositoryPref(),
          childRepository ?? ChildRepository(),
        );

  @override
  ScrollFragmentState<Child> get initialState => ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Child>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      final result = await _loadChildUsecase.start();
      if (result.isSuccess()) {
        items.addAll(result.data.childs);
      }
      yield ScrollFragmentState(items);
    } else if (event is Add<Child>) {
      items.add(event.item);
      yield ScrollFragmentState(items);
    }
  }
}
