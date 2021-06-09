import 'package:flutter_number_fact/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource{
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}