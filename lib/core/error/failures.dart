import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final List<dynamic> properties =  const <dynamic>[];

  @override
  List<Object?> get props => <dynamic>[properties];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
