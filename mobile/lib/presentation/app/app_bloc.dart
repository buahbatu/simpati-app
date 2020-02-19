import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/data/firebase/auth_repository.dart';
import 'package:simpati/data/firebase/nurse_repository_firebase.dart';
import 'package:simpati/data/firebase/posyandu_repository_firebase.dart';
import 'package:simpati/data/local/nurse_repository_pref.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/auth_repository.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';
import 'package:simpati/domain/usecase/load_profile_usecase.dart';
import 'package:simpati/domain/usecase/logout_usecase.dart';

class AppState extends Equatable {
  final Nurse nurse;
  final Posyandu posyandu;

  AppState({this.nurse, this.posyandu});

  @override
  List<Object> get props => [nurse, posyandu];
}

enum AppEvent { AppLoaded, AppLogin, AppLogout, AppReLoaded }

class AppBloc extends Bloc<AppEvent, AppState> {
  AppState state = AppState();

  final LogoutUsecase _logoutUsecase;
  final LoadProfileUsecase _loadProfileUsecase;
  final LoadProfileUsecase _reloadProfileUsecase;

  final bool isDebug;

  AppBloc({
    this.isDebug = false,
    INurseRepository nurseRepositoryPref,
    IPosyanduRepository posyanduRepositoryPref,
    IPosyanduRepository posyanduRepositoryFirebase,
    IAuthRepository authRepository,
    AppPreferance appPreferance,
  })  : this._loadProfileUsecase = LoadProfileUsecase(
          nurseRepositoryPref ?? NurseRepositoryPref(),
          posyanduRepositoryFirebase ?? PosyanduRepositoryPref(),
        ),
        this._reloadProfileUsecase = LoadProfileUsecase(
          nurseRepositoryPref ?? NurseRepositoryPref(),
          posyanduRepositoryFirebase ?? PosyanduRepositoryFirebase(),
        ),
        this._logoutUsecase = LogoutUsecase(
          authRepository ?? AuthRepository(),
          appPreferance ?? AppPreferance.get(),
        );

  @override
  AppState get initialState => state;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    AppState newState;
    if (event == AppEvent.AppLoaded) {
      newState = await onAppLoaded();
    } else if (event == AppEvent.AppReLoaded) {
      newState = await onAppReLoaded();
    } else if (event == AppEvent.AppLogin) {
      newState = await onAppLogin();
    } else if (event == AppEvent.AppLogout) {
      newState = await onAppLogout();
    }

    yield newState ?? state;
    state = newState;
  }

  Future<AppState> onAppLoaded() async {
    final authInfo = await _loadProfileUsecase.start();

    return AppState(
      nurse: authInfo.nurse,
      posyandu: authInfo.posyandu,
    );
  }

  Future<AppState> onAppReLoaded() async {
    final authInfo = await _reloadProfileUsecase.start();
    _loadProfileUsecase.store(authInfo);

    return AppState(
      nurse: authInfo.nurse,
      posyandu: authInfo.posyandu,
    );
  }

  Future<AppState> onAppLogin() async {
    final authInfo = await _loadProfileUsecase.start();

    return AppState(
      nurse: authInfo.nurse,
      posyandu: authInfo.posyandu,
    );
  }

  Future<AppState> onAppLogout() async {
    await _logoutUsecase.start();
    return AppState();
  }
}
