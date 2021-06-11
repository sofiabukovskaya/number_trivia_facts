import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_number_fact/core/platform/network_info.dart';
import 'package:flutter_number_fact/core/util/input_converter.dart';
import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_fact/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_number_fact/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final GetIt serviceLocator = GetIt.instance;
Future<void> init() async {
    //BLoC
    serviceLocator.registerFactory(() => NumberTriviaBloc(getConcreteNumberTrivia: serviceLocator(),
        getRandomNumberTrivia: serviceLocator(),
        inputConverter: serviceLocator()));
    //Use cases
    serviceLocator.registerLazySingleton(() => GetConcreteNumberTrivia(serviceLocator()));
    serviceLocator.registerLazySingleton(() => GetRandomNumberTrivia(serviceLocator()));

    //Core
    serviceLocator.registerLazySingleton(() => InputConverter());
    serviceLocator.registerLazySingleton(() => NetworkInfoImpl(serviceLocator()));

    //Repository
    serviceLocator.registerLazySingleton(() => NumberTriviaRepositoryImpl(remoteDataSource: serviceLocator(),
        numberTriviaLocalDataSource: serviceLocator(),
        networkInfo: serviceLocator()));

    //Data sources
    serviceLocator.registerLazySingleton(() => NumberTriviaRemoteDataSourceImpl(client: serviceLocator()));
    serviceLocator.registerLazySingleton(() => NumberTriviaLocalDataSourceImpl(sharedPreferences: serviceLocator()));

    //External
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    serviceLocator.registerLazySingleton(()  => sharedPreferences);
    serviceLocator.registerLazySingleton(()  => http.Client());
    serviceLocator.registerLazySingleton(()  => DataConnectionChecker());
    
}