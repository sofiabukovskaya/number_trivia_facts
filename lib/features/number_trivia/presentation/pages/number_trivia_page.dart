import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/widgets/loading_widget.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/widgets/message_display.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/widgets/trivia_controls.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/widgets/trivia_display.dart';
import 'package:flutter_number_fact/injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
      body: BlocProvider<NumberTriviaBloc>(
        create: (_) => sl<NumberTriviaBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                    builder: (BuildContext context, NumberTriviaState state) {
                  if (state is Empty) {
                    return const MessageDisplay(message: 'Start searching!');
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay(numberTrivia: state.numberTrivia);
                  } else if (state is Error) {
                    return MessageDisplay(message: state.message);
                  }
                  return Container();
                }),
              ),
              const SizedBox(height: 20),
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}
