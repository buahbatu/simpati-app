import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/data/firebase/pregnancy_repository.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';
import 'package:simpati/domain/usecase/load_pregnancy_usecase.dart';

class PregnancyListBloc extends ScrollFragmentBloc<Pregnancy> {
  final LoadPregnancyUsecase _loadPregnancyUsecase;
  final Mother mother;

  PregnancyListBloc(this.mother, {IPregnancyRepository pregnancyRepository})
      : this._loadPregnancyUsecase = LoadPregnancyUsecase(
          pregnancyRepository ?? PregnancyRepository(),
        );

  @override
  ScrollFragmentState<Pregnancy> get initialState => ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Pregnancy>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      final result = await _loadPregnancyUsecase.start(mother);
      if (result.isSuccess()) {
        items.addAll(result.data.pregnancy);
      }
      yield ScrollFragmentState(items);
    } else if (event is Add<Pregnancy>) {
      items
        ..add(event.item)
        ..sort((a, b) => a.lastMenstruation.compareTo(b.lastMenstruation));
      yield ScrollFragmentState(items);
    }
  }
}
