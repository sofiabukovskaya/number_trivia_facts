import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/exceptions.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/core/platform/network_info.dart';
import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.numberTriviaLocalDataSource,
      required this.networkInfo});

  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    if (await networkInfo.isConnected) {
      try {
        final NumberTriviaModel remoteTrivia =
            await remoteDataSource.getConcreteNumberTrivia(number);
        numberTriviaLocalDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final NumberTriviaModel localTrivia =
            await numberTriviaLocalDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    if (await networkInfo.isConnected) {
      try {
        final NumberTriviaModel remoteTrivia =
            await remoteDataSource.getRandomNumberTrivia();
        numberTriviaLocalDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final NumberTriviaModel localTrivia =
            await numberTriviaLocalDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
