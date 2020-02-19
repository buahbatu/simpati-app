import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/data/firebase/pregnancy_repository.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/entity/pregnancy_check.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';
import 'package:simpati/domain/usecase/create_pregnancy_check_usecase.dart';
import 'package:simpati/domain/usecase/load_pregnancy_check_usecase.dart';

class PregnancyCheckBloc extends ScrollFragmentBloc<PregnancyCheck> {
  final LoadPregnancyCheckUsecase _loadPregnancyCheckUsecase;
  final CreatePregnancyCheckUsecase _createPregnancyCheckUsecase;
  final Mother mother;
  final Pregnancy pregnancy;

  PregnancyCheckBloc(
    this.mother,
    this.pregnancy, {
    IPregnancyRepository pregnancyRepository,
  })  : this._loadPregnancyCheckUsecase = LoadPregnancyCheckUsecase(
          pregnancyRepository ?? PregnancyRepository(),
        ),
        this._createPregnancyCheckUsecase = CreatePregnancyCheckUsecase(
          pregnancyRepository ?? PregnancyRepository(),
        );

  @override
  ScrollFragmentState<PregnancyCheck> get initialState =>
      ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<PregnancyCheck>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      final result = await _loadPregnancyCheckUsecase.start(mother, pregnancy);
      if (result.isSuccess()) {
        items.addAll(result.data.pregnancyMeds);
      }
      yield ScrollFragmentState(items);
    } else if (event is Add<PregnancyCheck>) {
      final result = await _createPregnancyCheckUsecase.start(
        mother,
        pregnancy,
        event.item,
      );
      if (result.isSuccess()) {
        items.add(result.data);
      }
      yield ScrollFragmentState(items);
    }
  }
}
