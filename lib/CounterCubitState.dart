import 'package:bloc_header/CounterCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<Counter> {
  CounterCubit({@required Counter counter}) : super(counter);

  void increament() {
    emit(Counter(value: state.value + 1));
  }

  void decreament() {
    emit(Counter(value: state.value - 1));
  }
}
