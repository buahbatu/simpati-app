import 'package:bloc/bloc.dart';
import 'package:simpati/data/firebase/mother_repository.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';

import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/repository/mother_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';
import 'package:simpati/domain/usecase/create_mother_Usecase.dart';

class AddMotherEvent {}

enum AddMotherState { Init, Failed, Success }

class AddMotherBloc extends Bloc<AddMotherEvent, AddMotherState> {
  Mother mother = Mother(province: 'Jawa Barat', city: 'Sumedang');

  final CreateMotherUsecase _createMotherUsecase;

  AddMotherBloc({
    IMotherRepository motherRepository,
    IPosyanduRepository posyanduRepositoryPref,
  }) : this._createMotherUsecase = CreateMotherUsecase(
          motherRepository ?? MotherRepository(),
          posyanduRepositoryPref ?? PosyanduRepositoryPref(),
        );

  @override
  AddMotherState get initialState => AddMotherState.Init;

  @override
  Stream<AddMotherState> mapEventToState(AddMotherEvent event) async* {
    final result = await _createMotherUsecase.start(mother);
    if (result.isSuccess()) {
      mother = result.data;
      yield AddMotherState.Success;
    } else {
      yield AddMotherState.Failed;
    }
  }
}
