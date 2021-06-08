import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  GetConcreteNumberTrivia(this.numberTriviaRepository);

  final NumberTriviaRepository numberTriviaRepository;

  Future<Either<Failure, NumberTrivia>> call({
  required int number,
}) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(number);
  }
}
