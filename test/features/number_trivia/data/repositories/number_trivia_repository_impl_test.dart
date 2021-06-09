import 'package:flutter_number_fact/core/platform/network_info.dart';
import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource{}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo{}

void main(){
  final MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  final MockLocalDataSource mockLocalDataSource = MockLocalDataSource();
  final MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
   final  NumberTriviaRepositoryImpl repositoryImpl= NumberTriviaRepositoryImpl(remoteDataSource: mockRemoteDataSource,
        numberTriviaLocalDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo);

   group('getConcreteNumberTrivia', () {
     const int testNumber = 1;
     test('should check if the device is online', () async {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          repositoryImpl.getConcreteNumberTrivia(testNumber);
          verify(mockNetworkInfo.isConnected);
     });
   });

}