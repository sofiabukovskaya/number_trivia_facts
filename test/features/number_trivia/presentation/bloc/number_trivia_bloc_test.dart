import 'package:flutter_number_fact/core/util/input_converter.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  final MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia =
      MockGetConcreteNumberTrivia();
  final MockGetRandomNumberTrivia mockGetRandomNumberTrivia =
      MockGetRandomNumberTrivia();
  final MockInputConverter mockInputConverter = MockInputConverter();
  NumberTriviaBloc numberTriviaBloc = NumberTriviaBloc(
      getConcreteNumberTrivia: mockGetConcreteNumberTrivia,
      getRandomNumberTrivia: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter);
  test('initialState should be empty', () {
    expect(numberTriviaBloc.initialState, equals(Empty()));
  });
}
