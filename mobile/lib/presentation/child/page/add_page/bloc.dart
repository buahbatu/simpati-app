import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/data/firebase/child_repository.dart';
import 'package:simpati/data/firebase/config_repository.dart';
import 'package:simpati/data/firebase/person_meta_repository.dart';
import 'package:simpati/data/firebase/posyandu_repository_firebase.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/repository/config_repository.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';
import 'package:simpati/domain/usecase/create_child_usecase.dart';
import 'package:simpati/domain/usecase/person_meta_usecase.dart';
import 'package:simpati/domain/usecase/update_meta_usecase.dart';
import 'package:simpati/domain/usecase/update_posyandu_size_usecase.dart';

class AddChildEvent {}

enum AddChildState { Init, Loading, Failed, Success }

class AddChildBloc extends Bloc<AddChildEvent, AddChildState> {
  Child child = Child(isGirl: true);

  final CreateChildUsecase _createChildUsecase;
  final UpdatePersonMetaUsecase _updatePersonMetaUsecase;
  final UpdatePosyanduSizeUsecase _updatePosyanduUsecase;

  AddChildBloc({
    IChildRepository motherRepository,
    IConfigRepository configRepository,
    IPersonMetaRepository metaRepository,
    IPosyanduRepository posyanduRepositoryPref,
    IPosyanduRepository posyanduRepositoryFirebase,
  })  : this._createChildUsecase = CreateChildUsecase(
          motherRepository ?? ChildRepository(),
          posyanduRepositoryPref ?? PosyanduRepositoryPref(),
        ),
        this._updatePersonMetaUsecase = UpdatePersonMetaUsecase(
          configRepository ?? ConfigRepository(),
          metaRepository ?? PersonMetaRepository(),
        ),
        this._updatePosyanduUsecase = UpdatePosyanduSizeUsecase(
          posyanduRepositoryPref ?? PosyanduRepositoryPref(),
          posyanduRepositoryFirebase ?? PosyanduRepositoryFirebase(),
        );

  @override
  AddChildState get initialState => AddChildState.Init;

  @override
  Stream<AddChildState> mapEventToState(AddChildEvent event) async* {
    yield AddChildState.Loading;
    final result = await _createChildUsecase.start(child);
    if (result.isSuccess()) {
      child = result.data;
      await _updatePersonMetaUsecase.start(
        PersonMetaUsecase.Child,
        child.posyanduId,
      );
      await _updatePosyanduUsecase.start(
        PersonMetaUsecase.Child,
        FieldValue.increment(1),
      );
      yield AddChildState.Success;
    } else {
      yield AddChildState.Failed;
    }
  }
}
