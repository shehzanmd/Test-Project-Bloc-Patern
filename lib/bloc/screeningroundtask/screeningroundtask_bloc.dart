import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screeningroundtask_event.dart';
part 'screeningroundtask_state.dart';

class ScreeningroundtaskBloc extends Bloc<ScreeningroundtaskEvent, ScreeningroundtaskState> {

  ScreeningroundtaskBloc() : super(RandomInitial()) {
    on<ScreeningroundtaskEvent>((event, emit) {

      if (event is TapWidget2Event) {

        var randomNumber = generateRandomNumber();

        print("************** Random No: $randomNumber *********************");

        emit(RandomGenerated(randomNumber));

        final currentTime = DateTime.now().second;

        print("************** currentTime: $currentTime *********************");

        if (randomNumber == currentTime) {

          emit(SuccessState("Success"));
        } else {
          emit(TryAgainState("Try again"));
        }
      }



    }
    );
  }

  int generateRandomNumber() {
    return DateTime.now().second + (Random().nextInt(60 - DateTime.now().second));
  }

}

