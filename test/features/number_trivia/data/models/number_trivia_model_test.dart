import 'dart:convert';

import 'package:flutter_number_fact/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const NumberTriviaModel testNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test');

  test('should be a subclass of NumberTrivia entity', ()async {
    expect(testNumberTriviaModel, isA<NumberTrivia>());
  });
  
  group('fromJson', () {
    test('should return a valid model when JSON number is an integer', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      final NumberTriviaModel result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, testNumberTriviaModel);

     });

    test('should return a valid model when JSON number is double', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia_double.json'));
      final NumberTriviaModel result = NumberTriviaModel.fromJson(jsonMap);
      expect(result, testNumberTriviaModel);
    });
  });
  
  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      final Map<String, dynamic> result = testNumberTriviaModel.toJson();
      final Map<String, dynamic> expectedMap = <String, dynamic>{
        'text': 'Test',
        'number': 1
      };
      expect(result, expectedMap);
    });
  });
}