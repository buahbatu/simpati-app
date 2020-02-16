import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/usecase/load_profile_usecase.dart';
import 'package:simpati/domain/usecase/logout_usecase.dart';

class AppState extends Equatable {
  final Nurse nurse;
  final Posyandu posyandu;

  AppState({this.nurse, this.posyandu});

  @override
  List<Object> get props => [nurse, posyandu];
}

enum AppEvent { AppLoaded, AppLogin, AppLogout }

class AppBloc extends Bloc<AppEvent, AppState> {
  AppState state = AppState();

  final LoadProfileUsecase _loadProfileUsecase;
  final LogoutUsecase _logoutUsecase;

  AppBloc({
    LoadProfileUsecase loadProfileUsecase,
    LogoutUsecase logoutUsecase,
  })  : this._loadProfileUsecase = loadProfileUsecase ?? LoadProfileUsecase(),
        this._logoutUsecase = logoutUsecase ?? LogoutUsecase();

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
    final authInfo = await _loadProfileUsecase.start();

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
