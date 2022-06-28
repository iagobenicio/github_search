
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/repositories/search_repository.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search/modules/search/external/datasource/github_datasource.dart';
import 'package:github_search/modules/search/infra/datasource/search_datasource.dart';
import 'package:github_search/modules/search/infra/repositories/search_repository_imp.dart';


void main() {
  GetIt.instance.registerSingleton<Dio>(Dio());
  GetIt.instance.registerSingleton<SearchDataSource>(GithubDataSource(GetIt.instance.get<Dio>()));
  GetIt.instance.registerSingleton<SearchRepository>(SearchRepositoryImp(GetIt.instance.get<SearchDataSource>()));
  GetIt.instance.registerSingleton<SearchByText>(SearchByTextImpl(GetIt.instance.get<SearchRepository>()));
  
  test('Deve recuperar o usecase sem erro', (){
      final usecase = GetIt.instance.get<SearchByText>();
      expect(usecase, isA<SearchByTextImpl>());
  });

  test('Deve recuperar a lista de ResultSearch', () async{
      final usecase = GetIt.instance.get<SearchByText>();
      final result = await usecase("Iago");

      expect(result!.isRight(), true);
  });

}