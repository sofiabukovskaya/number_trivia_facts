import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_number_fact/injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
      body: BlocProvider<NumberTriviaBloc>(
        create: (_) => serviceLocator<NumberTriviaBloc>(),
        child: Container(),
      ),
    );
  }
}
