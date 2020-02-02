import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/domain/entity/kid.dart';

class KidBloc extends ScrollFragmentBloc<Kid> {
  @override
  ScrollFragmentState<Kid> get initialState => ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Kid>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Add<Kid>) {
      items.add(event.item);
      yield ScrollFragmentState(items);
    }
  }
}
