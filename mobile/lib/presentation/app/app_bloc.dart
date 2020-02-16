import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/data/local/nurse_repository_pref.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class AppState extends Equatable {
  final Nurse nurse;
  final Posyandu posyandu;

  AppState({this.nurse, this.posyandu});

  AppState copyWith({Nurse nurse, Posyandu posyandu}) {
    return AppState(
      nurse: nurse ?? this.nurse,
      posyandu: posyandu ?? this.posyandu,
    );
  }

  @override
  List<Object> get props => [nurse, posyandu];
}

enum AppEvent { AppLoaded, AppLogin, AppLogout }

class AppBloc extends Bloc<AppEvent, AppState> {
  AppState state = AppState();

  final INurseRepository _nurseRepositoryPref;
  final IPosyanduRepository _posyanduRepositoryPref;
  final AppPreferance _appPreferance;

  AppBloc({
    INurseRepository nurseRepositoryPref,
    IPosyanduRepository posyanduRepositoryPref,
    AppPreferance appPreferance,
  })  : this._nurseRepositoryPref =
            nurseRepositoryPref ?? NurseRepositoryPref(),
        this._posyanduRepositoryPref =
            posyanduRepositoryPref ?? PosyanduRepositoryPref(),
        this._appPreferance = appPreferance ?? AppPreferance.get();

  @override
  AppState get initialState => state;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    AppState newState;
    if (event == AppEvent.AppLoaded) {
      newState = await onAppLoaded();
    } else if (event == AppEvent.AppLogin) {
      newState = await onAppLogin();
    } else if (event == AppEvent.AppLogout) {
      newState = await onAppLogout();
    }

    yield newState ?? state;
    state = newState;
  }

  Future<AppState> onAppLoaded() async {
    final nurseResult = await _nurseRepositoryPref.getProfile();
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();
    return state.copyWith(
      nurse: nurseResult.data,
      posyandu: posyanduResult.data,
    );
  }

  Future<AppState> onAppLogin() async {
    final nurseResult = await _nurseRepositoryPref.getProfile();
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();
    return state.copyWith(
      nurse: nurseResult.data,
      posyandu: posyanduResult.data,
    );
  }

  Future<AppState> onAppLogout() async {
    await _appPreferance.clearPref();
    return AppState();
  }
}
