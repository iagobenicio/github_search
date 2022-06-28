import 'package:dartz/dartz.dart';
import 'package:github_search/modules/search/domain/entites/result_search.dart';
import 'package:github_search/modules/search/domain/errors/erros.dart';
import 'package:github_search/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText{
  Future<Either<FailureSearch,List<ResultSearch>>>? call(String? searchText);
}

class SearchByTextImpl implements SearchByText{

  SearchRepository? repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch,List<ResultSearch>>> call(String? searchText)async{
    if(searchText == null || searchText.isEmpty){
      return Left(InvalidName());
    }
    return repository!.search(searchText);

  }

}


