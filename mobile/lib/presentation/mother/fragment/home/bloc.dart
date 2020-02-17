import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/data/firebase/mother_repository.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/repository/mother_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';
import 'package:simpati/domain/usecase/load_mom_usecase.dart';

class MotherBloc extends ScrollFragmentBloc<Mother> {
  final LoadMomUsecase _loadMomUsecase;

  MotherBloc({
    IPosyanduRepository posyanduRepositoryPref,
    IMotherRepository motherRepository,
  }) : this._loadMomUsecase = LoadMomUsecase(
          posyanduRepositoryPref ?? PosyanduRepositoryPref(),
          motherRepository ?? MotherRepository(),
        );

  @override
  ScrollFragmentState<Mother> get initialState => ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Mother>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      final result = await _loadMomUsecase.start();
      if (result.isSuccess()) {
        items.addAll(result.data.mothers);
      }
      yield ScrollFragmentState(items);
    } else if (event is Add<Mother>) {
      items.add(event.item);
      yield ScrollFragmentState(items);
    }
  }
}
