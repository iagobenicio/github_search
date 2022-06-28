import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_search/modules/search/infra/datasource/search_datasource.dart';
import 'package:github_search/modules/search/presenter/search_bloc.dart';
import 'modules/search/domain/repositories/search_repository.dart';
import 'modules/search/domain/usecases/search_by_text.dart';
import 'modules/search/external/datasource/github_datasource.dart';
import 'modules/search/infra/repositories/search_repository_imp.dart';
import 'modules/search/presenter/search_page.dart';

void main() {
  GetIt.instance.registerSingleton<Dio>(Dio());
  GetIt.instance.registerSingleton<SearchDataSource>(GithubDataSource(GetIt.instance.get<Dio>()));
  GetIt.instance.registerSingleton<SearchRepository>(SearchRepositoryImp(GetIt.instance.get<SearchDataSource>()));
  GetIt.instance.registerSingleton<SearchByText>(SearchByTextImpl(GetIt.instance.get<SearchRepository>()));
  GetIt.instance.registerSingleton<SearchBloc>(SearchBloc(GetIt.instance.get<SearchByText>()));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SearchPage(),
  ));
}