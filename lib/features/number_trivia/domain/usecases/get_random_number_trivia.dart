import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/core/usecases/usecase.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  GetRandomNumberTrivia(this.numberTriviaRepository);

  final NumberTriviaRepository numberTriviaRepository;

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params)async {
   return await numberTriviaRepository.getRandomNumberTrivia();
  }
}


