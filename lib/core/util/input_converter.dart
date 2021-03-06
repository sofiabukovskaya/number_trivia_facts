import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/failures.dart';

class InputConverter{
      Either<Failure, int> stringToUnsignedInteger(String str) {
            try {
                  final int integer = int.parse(str);
                  if(integer <0) throw const FormatException();
                  return Right<Failure, int>(integer);
            } on FormatException{
                  return Left<Failure, int>(InvalidInputFailure());
            }
      }
}

class InvalidInputFailure extends Failure{}