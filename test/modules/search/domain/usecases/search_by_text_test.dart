import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/entites/result_search.dart';
import 'package:github_search/modules/search/domain/errors/erros.dart';
import 'package:github_search/modules/search/domain/repositories/search_repository.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:mocktail/mocktail.dart';



class SearchRepositoryMock extends Mock implements SearchRepository{}

main() {

  final repository = SearchRepositoryMock();

  final usecase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async{

    when(() => repository.search(any())).thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase("Iago");
    expect(result.isRight(), true);
  });

  test('deve retornar um InvalidName', () async{

    when(() => repository.search(any())).thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase("");
 
    expect(result.fold(id, id), isA<InvalidName>());
  });

}