import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/entites/result_search.dart';
import 'package:github_search/modules/search/domain/errors/erros.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search/modules/search/presenter/search_bloc.dart';
import 'package:github_search/modules/search/presenter/serach_page_state.dart';
import 'package:mocktail/mocktail.dart';


class SearByTexMock extends Mock implements SearchByText{}

void main() {
  final usecase = SearByTexMock();
  final bloc = SearchBloc(usecase);

  test("deve retornar os emits em ordem", (){
    when(() => usecase.call(any())).thenAnswer((_) async => Right(<ResultSearch>[]));
    expect(bloc.stream, emitsInOrder([
      isA<SearchLoading>(),
      isA<SearchSuccess>()
    ]));
    bloc.add("Iago");
  });

  test("deve retornar um erro", (){
    when(() => usecase.call(any())).thenAnswer((_) async => Left(InvalidName()));
    expect(bloc.stream, emitsInOrder([
      isA<SearchLoading>(),
      isA<SearchError>()
    ]));
    bloc.add("Iago");
  });
  

}