import 'package:dartz/dartz.dart';
import 'package:flutter_number_fact/core/error/failures.dart';
import 'package:flutter_number_fact/core/usecases/usecase.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  final MockNumberTriviaRepository mockNumberTriviaRepository =
      MockNumberTriviaRepository();
  final GetRandomNumberTrivia usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);

  const NumberTrivia testNumberTrivia = NumberTrivia(text: 'ddd', number: 1);
  test('should get trivia from the repository', () async {
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => const Right<Failure, NumberTrivia>(testNumberTrivia));

    final Either<Failure, NumberTrivia> result = await usecase(NoParams());

    expect(result, const Right<dynamic, NumberTrivia>(testNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
