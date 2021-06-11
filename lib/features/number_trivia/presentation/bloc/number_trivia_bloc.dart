import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_fact/core/util/input_converter.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  NumberTriviaBloc(
      {required this.getConcreteNumberTrivia,
      required this.getRandomNumberTrivia,
      required this.inputConverter})
      : super(Empty());

  NumberTriviaState get initialState => Empty();

  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {
    if(event is GetTriviaForConcreteNumber) {
      inputConverter.stringToUnsignedInteger(event.numberString);
    }
  }
}
