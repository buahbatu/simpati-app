import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/domain/entity/mother.dart';

class MotherBloc extends ScrollFragmentBloc<Mother> {
  @override
  ScrollFragmentState<Mother> get initialState => ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Mother>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Init) {
      // final posyanduMetaResult = await _loadPosyanduMetaUsecase.start();
      // final size = posyanduMetaResult.data.size;
      // items.addAll(articleResult.data.articles);
      yield ScrollFragmentState(items);
    } else if (event is Add<Mother>) {
      items.add(event.item);
      yield ScrollFragmentState(items);
    }
  }
}
