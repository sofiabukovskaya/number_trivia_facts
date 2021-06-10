import 'dart:convert';

import 'package:flutter_number_fact/core/error/exceptions.dart';
import 'package:flutter_number_fact/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;

abstract class NumberTriviaRemoteDataSource{
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource{
  NumberTriviaRemoteDataSourceImpl({required this.client});
  final http.Client client;


  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final http.Response response = await client.get(Uri.parse('http://numbersapi.com/$number'), headers: <String, String>{
      'Content-Type': 'application/json',
    }); 
    if(response.statusCode == 200) {
      return NumberTriviaModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException('Bad response from server');
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final http.Response response = await client.get(Uri.parse('http://numbersapi.com/random'), headers: <String, String>{
      'Content-Type': 'application/json',
    });
    if(response.statusCode == 200) {
      return NumberTriviaModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException('Bad response from server');
    }
  }
}