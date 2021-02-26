import 'package:bloc_header/CounterCubit.dart';
import 'package:bloc_header/CounterCubitState.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test counter bloc", () {
    CounterCubit _counterCubit;
    setUp(() {
      _counterCubit = CounterCubit(counter: Counter(value: 0));
    });

    tearDown(() {
      _counterCubit.close();
    });

    test("counter with 0", () {
      expect(_counterCubit.state, Counter(value: 0));
    });

    blocTest<CounterCubit, Counter>("inc 3 times",
        build: () => _counterCubit,
        act: (cubit) {
          cubit.increament();
          cubit.increament();
          cubit.increament();
        },
        expect: [
          Counter(value: 1),
          Counter(value: 2),
          Counter(value: 3),
        ]);
  });
}
