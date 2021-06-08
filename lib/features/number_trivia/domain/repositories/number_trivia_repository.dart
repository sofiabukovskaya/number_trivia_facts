import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository{
Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}