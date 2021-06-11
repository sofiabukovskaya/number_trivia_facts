import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/core/usecases/usecase.dart';
import 'package:flutter_number_fact/core/util/input_converter.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input = The number must be a positive int or zero';

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
    if (event is GetTriviaForConcreteNumber) {
      final Either<Failure, int> inputEither =
          inputConverter.stringToUnsignedInteger(event.numberString);
      yield* inputEither.fold((_) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      }, (int integer) async* {
        yield Loading();
        final Either<Failure, NumberTrivia> failureOrTrivia =
            await getConcreteNumberTrivia(Params(number: integer));
        yield failureOrTrivia.fold(
            (Failure failre) => Error(message: SERVER_FAILURE_MESSAGE),
            (NumberTrivia trivia) => Loaded(numberTrivia: trivia));
      });
    }
    if (event is GetTriviaForRandomNumber) {
      yield Loading();
      final Either<Failure, NumberTrivia> failureOrTrivia =
          await getRandomNumberTrivia(NoParams());
      yield failureOrTrivia.fold(
          (fail) => Error(message: SERVER_FAILURE_MESSAGE),
          (NumberTrivia numberTrivia) => Loaded(numberTrivia: numberTrivia));
    }
  }
}
