import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_number_fact/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {

  final MockDataConnectionChecker mockDataConnectionChecker = MockDataConnectionChecker();
  final NetworkInfoImpl networkInfo = NetworkInfoImpl(mockDataConnectionChecker);

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
          () async {
        final Future<bool> tHasConnectionFuture = Future<bool>.value(true);
        when(mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
        final Future<bool> result = networkInfo.isConnected;
        verify(mockDataConnectionChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}