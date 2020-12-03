import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:couterapp_with_bloc_flutter/counter_repo.dart';

/* inside this bloc screen we define 3 things
1. Event  - to show all possible events
 2. State - to show all possible states
 3. Bloc - how to map those events to the states
 */
// Event
class CounterScreenEvent extends Equatable {
  /*Equatable makes our classes equatable/comparable, which is required for the mapping logic inside the bloc class.
Equatable asks you to override the get props like we’ve done here.*/
  @override
  List<Object> get props => null;
}

class IncrementCounterValue extends CounterScreenEvent {}

class DecrementCounterValue extends CounterScreenEvent {}

class GenerateRandomCounterValue extends CounterScreenEvent {}

//States
class CounterScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowLoadingCounterScreen extends CounterScreenState {}

class ShowCounterValue extends CounterScreenState {
  @override
  List<Object> get props => [counterValue];
  final int counterValue;
  ShowCounterValue(this.counterValue);
}

//Bloc
class CounterScreenBloc extends Bloc<CounterScreenEvent, CounterScreenState> {
  int counterValue = 0;
  @override
  CounterScreenState get initialState => ShowCounterValue(counterValue);

  @override
  Stream<CounterScreenState> mapEventToState(CounterScreenEvent event) async* {
    /* async returns a future statement/value after a successful operation.
      async* returns a  Stream. their operation continues and can yield many values.
    */
    /// Map event to state.
    if (event is IncrementCounterValue) {
      this.counterValue++;
      yield ShowCounterValue(counterValue);
    }

    if (event is DecrementCounterValue) {
      this.counterValue--;
      yield ShowCounterValue(counterValue);
    }

    if (event is GenerateRandomCounterValue) {
      ///show loading screen
      yield ShowLoadingCounterScreen();

      ///create a repo called CounterRepo
      ///which is responsible for getting data
      counterValue = await CounterRepo().getRandomValue();

      ///show the random number
      yield ShowCounterValue(counterValue);
    }
  }
}
