import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/data/local/nurse_repository_pref.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';

class AppState extends Equatable {
  final Nurse nurse;
  final Posyandu posyandu;

  AppState(this.nurse, this.posyandu);

  AppState copyWith({Nurse nurse, Posyandu posyandu}) {
    return AppState(
      nurse ?? this.nurse,
      posyandu ?? this.posyandu,
    );
  }

  @override
  List<Object> get props => [nurse, posyandu];
}

enum AppEvent { AppLoaded }

class AppBloc extends Bloc<AppEvent, AppState> {
  AppState state;
  final NurseRepositoryPref nurseRepositoryPref;

  AppBloc({NurseRepositoryPref nurseRepositoryPref})
      : this.nurseRepositoryPref = nurseRepositoryPref ?? NurseRepositoryPref();

  @override
  AppState get initialState => state;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event == AppEvent.AppLoaded) await onAppLoaded();

    yield state;
  }

  Future<void> onLogout() async {
    await AppPreferance.get().clearPref();
  }

  void onAppLoaded() async {
    final response = await nurseRepositoryPref.getProfile();
    state = state.copyWith(nurse: response.data);
  }
}
