import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/data/firebase/child_repository.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/child_check.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/usecase/create_child_check_usecase.dart';
import 'package:simpati/domain/usecase/load_child_check_usecase.dart';

class ChildCheckBloc extends ScrollFragmentBloc<ChildCheck> {
  final LoadChildCheckUsecase _loadChildCheckUsecase;
  final CreateChildCheckUsecase _createChildCheckUsecase;
  final Child child;

  ChildCheckBloc(this.child, {IChildRepository childRepository})
      : this._loadChildCheckUsecase = LoadChildCheckUsecase(
          childRepository ?? ChildRepository(),
        ),
        this._createChildCheckUsecase = CreateChildCheckUsecase(
          childRepository ?? ChildRepository(),
        );

  @override
  ScrollFragmentState<ChildCheck> get initialState =>
      ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<ChildCheck>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      final result = await _loadChildCheckUsecase.start(child);
      if (result.isSuccess()) {
        items.addAll(result.data.childMeds);
      }
      yield ScrollFragmentState(items);
    } else if (event is Add<ChildCheck>) {
      final result = await _createChildCheckUsecase.start(child, event.item);
      if (result.isSuccess()) {
        items.add(result.data);
      }
      yield ScrollFragmentState(items);
    }
  }
}
