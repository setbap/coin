import 'package:bloc_header/CounterCubit.dart';
import 'package:bloc_header/CounterCubitState.dart';
import 'package:bloc_header/presentations/pages/coin_search.dart';
// import 'package:bloc_header/presentations/pages/responsive_portfolio.dart';
// import 'package:bloc_header/presentations/pages/travel_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(
        counter: Counter(
          value: 0,
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.orange,
            accentColor: Colors.white,
            brightness: Brightness.dark),
        home: CoinSearchMain(),
      ),
    );
  }
}
