import 'package:bloc/bloc.dart';
import 'package:simpati/data/firebase/config_repository.dart';
import 'package:simpati/data/firebase/mother_repository.dart';
import 'package:simpati/data/firebase/person_meta_repository.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';

import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/repository/config_repository.dart';
import 'package:simpati/domain/repository/mother_repository.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';
import 'package:simpati/domain/usecase/create_mother_usecase.dart';
import 'package:simpati/domain/usecase/person_meta_usecase.dart';
import 'package:simpati/domain/usecase/update_meta_usecase.dart';

class AddMotherEvent {}

enum AddMotherState { Init, Loading, Failed, Success }

class AddMotherBloc extends Bloc<AddMotherEvent, AddMotherState> {
  Mother mother = Mother(province: 'Jawa Barat', city: 'Sumedang');

  final CreateMotherUsecase _createMotherUsecase;
  final UpdatePersonMetaUsecase _updatePersonMetaUsecase;

  AddMotherBloc({
    IMotherRepository motherRepository,
    IPosyanduRepository posyanduRepositoryPref,
    IConfigRepository configRepository,
    IPersonMetaRepository metaRepository,
  })  : this._createMotherUsecase = CreateMotherUsecase(
          motherRepository ?? MotherRepository(),
          posyanduRepositoryPref ?? PosyanduRepositoryPref(),
        ),
        this._updatePersonMetaUsecase = UpdatePersonMetaUsecase(
          configRepository ?? ConfigRepository(),
          metaRepository ?? PersonMetaRepository(),
        );

  @override
  AddMotherState get initialState => AddMotherState.Init;

  @override
  Stream<AddMotherState> mapEventToState(AddMotherEvent event) async* {
    yield AddMotherState.Loading;
    final result = await _createMotherUsecase.start(mother);
    if (result.isSuccess()) {
      mother = result.data;
      await _updatePersonMetaUsecase.start(PersonMetaUsecase.Mother, mother);
      yield AddMotherState.Success;
    } else {
      yield AddMotherState.Failed;
    }
  }
}
