import 'dart:convert';

import 'package:github_search/modules/search/infra/datasource/search_datasource.dart';
import 'package:github_search/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

class GithubDataSource implements SearchDataSource{

  final Dio dio;

  GithubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText)async{
    final response = await dio.get("https://api.github.com/search/users?q=$searchText");
    if (response.statusCode == 200) {
      final list = (response.data["items"] as List).map((e) => ResultSearchModel.fromMap(e)).toList();
      return list;
    }
    throw Exception("erro");
  }

}