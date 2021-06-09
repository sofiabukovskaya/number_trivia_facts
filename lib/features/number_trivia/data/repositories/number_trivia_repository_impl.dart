import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/core/platform/network_info.dart';
import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  NumberTriviaRepositoryImpl({required this.remoteDataSource,
      required this.numberTriviaLocalDataSource, required this.networkInfo});

  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
