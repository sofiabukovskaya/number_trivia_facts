import 'dart:convert';

import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  final MockHttpClient mockHttpClient = MockHttpClient();
  final NumberTriviaRemoteDataSourceImpl numberTriviaRemoteDataSourceImpl = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  final NumberTriviaModel tNumberTriviaModel = NumberTriviaModel.fromJson(jsonDecode(fixture('trivia.json')));
  group('getConcreteNumberTrivia', () {
    const int testNumber = 1;
    test('should perform a GET request on a URL with number being the endpoint', () async {
      numberTriviaRemoteDataSourceImpl.getConcreteNumberTrivia(testNumber);
      verify(mockHttpClient.get(Uri.parse('http://numbersapi.com/$testNumber'), headers: <String, String>{
        'Content-Type': 'application/json',
      }));
    });

    test(
      'should return NumberTrivia when the response code is 200 (success)',
          () async {
        when(mockHttpClient.get(Uri.parse('http://numbersapi.com/'), headers: anyNamed('headers'))).thenAnswer(
              (_) async => http.Response(fixture('trivia.json'), 200),
        );
        final NumberTriviaModel result = await numberTriviaRemoteDataSourceImpl.getConcreteNumberTrivia(testNumber);
        expect(result, equals(tNumberTriviaModel));
      },
    );
  });
}