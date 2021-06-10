import 'package:equatable/equatable.dart';

abstract class NumberTriviaEvent{}

class GetTriviaForConcreteNumber extends NumberTriviaEvent{
  GetTriviaForConcreteNumber(this.numberString);
  final String numberString;
}

class GetTriviaForRandomNumber extends NumberTriviaEvent{}