import 'dart:convert';

import 'package:flutter_number_fact/core/error/exceptions.dart';
import 'package:flutter_number_fact/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const String cached_number_trivia = 'cached_number_trivia';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache)  {
    return sharedPreferences.setString(
        cached_number_trivia, jsonEncode(triviaToCache.toJson()));
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final String? jsonString =
        sharedPreferences.getString(cached_number_trivia);
    if (jsonString != null) {
      return Future<NumberTriviaModel>.value(NumberTriviaModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException('Cache ex!');
    }
  }
}
