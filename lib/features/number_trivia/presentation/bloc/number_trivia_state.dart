import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaState {}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  Loaded({required this.numberTrivia});
  final NumberTrivia numberTrivia;
}
class Error extends NumberTriviaState{
  Error({required this.message});
  final String message;
}


