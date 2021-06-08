import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  final MockNumberTriviaRepository mockNumberTriviaRepository =
      MockNumberTriviaRepository();
  GetConcreteNumberTrivia usecase =
      GetConcreteNumberTrivia(mockNumberTriviaRepository);

  const int testNumber = 1;
  const NumberTrivia testNumberTrivia = NumberTrivia(text: 'ddd', number: 1);
  test('should get trivia for the number from the repository', () async {
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(testNumber))
        .thenAnswer((_) async => const Right(testNumberTrivia));
    final Either<Failure, NumberTrivia> result =
        await usecase(number: testNumber);
    expect(result, const Right<dynamic, NumberTrivia>(testNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(testNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
