import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/data/firebase/child_repository.dart';
import 'package:simpati/data/firebase/config_repository.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/immunization.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/repository/config_repository.dart';
import 'package:simpati/domain/usecase/create_immunization_usecase.dart';
import 'package:simpati/domain/usecase/load_immunization_usecase.dart';

class ImmunizationListBloc extends ScrollFragmentBloc<Immunization> {
  final LoadImmunizationUsecase _loadImmunizationUsecase;
  final CreateImmunizationUsecase _createImmunizationUsecase;
  final Child child;

  ImmunizationListBloc(
    this.child, {
    IConfigRepository configRepository,
    IChildRepository childRepository,
  })  : this._loadImmunizationUsecase = LoadImmunizationUsecase(
          configRepository ?? ConfigRepository(),
          childRepository ?? ChildRepository(),
        ),
        this._createImmunizationUsecase = CreateImmunizationUsecase(
          childRepository ?? ChildRepository(),
        );

  @override
  ScrollFragmentState<Immunization> get initialState =>
      ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Immunization>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      final result = await _loadImmunizationUsecase.start(child);
      if (result.isSuccess()) {
        items.addAll(result.data.immunizations);
      }
      yield ScrollFragmentState(items);
    } else if (event is Add<Immunization>) {
      final result = await _createImmunizationUsecase.start(child, event.item);
      if (result.isSuccess()) {
        items.removeWhere((element) => element.key == result.data.key);
        items.add(result.data);
        items.sort(
          (a, b) => a.config.startMonth.compareTo(b.config.startMonth),
        );
      }
      yield ScrollFragmentState(items);
    }
  }
}
