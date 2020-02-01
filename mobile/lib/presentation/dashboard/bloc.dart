import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/domain/entity/transaction.dart';

class DashboardBloc extends ScrollFragmentBloc<Transaction> {
  @override
  ScrollFragmentState<Transaction> get initialState =>
      ScrollFragmentState(items);

  @override
  Stream<ScrollFragmentState<Transaction>> mapEventToState(
      ScrollFragmentEvent event) async* {
    if (event is Add<Transaction>) {
      items.add(event.item);
      yield ScrollFragmentState(items);
    }
  }
}
