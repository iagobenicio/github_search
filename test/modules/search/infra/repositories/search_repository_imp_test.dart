import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/entites/result_search.dart';
import 'package:github_search/modules/search/domain/errors/erros.dart';
import 'package:github_search/modules/search/infra/datasource/search_datasource.dart';
import 'package:github_search/modules/search/infra/models/result_search_model.dart';
import 'package:github_search/modules/search/infra/repositories/search_repository_imp.dart';
import 'package:mocktail/mocktail.dart';



class SearchDataSourceMock extends Mock implements SearchDataSource {}


main() {
  final datasource = SearchDataSourceMock();
  final repository = SearchRepositoryImp(datasource);

  test('deve retornar uma lista de ResultSearch', ()async{

    when(() => datasource.getSearch(any())).thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search("Iago");

    expect(result.isRight(), true);

  });

  test('deve retornar um DataSourceError se o datasource falhar', ()async{

    when(() => datasource.getSearch(any())).thenThrow(Exception());
    final result = await repository.search("Iago");

    expect(result.fold((l) => l, (r) => r), isA<DataSourceError>());

  });
}