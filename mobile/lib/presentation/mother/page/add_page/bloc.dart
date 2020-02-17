import 'package:bloc/bloc.dart';

import 'package:simpati/domain/entity/mother.dart';

class AddMotherEvent {}

class AddMotherState {}

class AddMotherBloc extends Bloc<AddMotherEvent, AddMotherState> {
  Mother mother = Mother(province: 'Jawa Barat', city: 'Sumedang');

  @override
  AddMotherState get initialState => AddMotherState();

  @override
  Stream<AddMotherState> mapEventToState(AddMotherEvent event) async* {
    // if (state.currentIndex < 3) {
    //   final newState = AddMotherState(state.currentIndex + 1);
    //   yield newState;
    //   state = newState;
    // }
  }
}
