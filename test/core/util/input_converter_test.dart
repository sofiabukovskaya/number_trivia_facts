// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/core/util/input_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final InputConverter inputConverter = InputConverter();
  
  group('stringToUnsignedInt', () {
    test('should return an integer when represents an unsigned integer ', () async {
      const String str = '123';
      final Either<Failure, int> result = inputConverter.stringToUnsignedInteger(str);
      expect(result, const Right<dynamic, int>(123));
    });
    
    test('should return an Failure when the string is not an integer', () async {
      const String str = 'abs';
      final Either<Failure, int> result = inputConverter.stringToUnsignedInteger(str);
      expect(result,  Left<InvalidInputFailure, dynamic>(InvalidInputFailure()));
    });
  });
}