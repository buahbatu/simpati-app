import 'package:bloc/bloc.dart';
import 'package:simpati/presentation/home/fragment.dart';

class HomeScreenBloc extends Bloc<BaseHomeFragment, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(BaseHomeFragment event) async* {
    yield event.position;
  }
}
