import 'package:couterapp_with_bloc_flutter/counter_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:couterapp_with_bloc_flutter/counter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      home: _buildCounterScreen(),
    );
  }

  Widget _buildCounterScreen() {
    /// we use BlocProvider
    return BlocProvider<CounterScreenBloc>(
      ///Define the Bloc to be used in the screen
      create: (context) => CounterScreenBloc(),

      ///Define the screen
      child: CounterScreen(),
    );
  }
}
