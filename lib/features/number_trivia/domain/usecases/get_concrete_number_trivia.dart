
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/core/usecases/usecase.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  GetConcreteNumberTrivia(this.numberTriviaRepository);

  final NumberTriviaRepository numberTriviaRepository;

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable{
  const Params({required this.number});
  final int number;
  @override
  List<Object?> get props => <int>[number];

}


