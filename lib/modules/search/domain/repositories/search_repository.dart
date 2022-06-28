import 'package:dartz/dartz.dart';
import 'package:github_search/modules/search/domain/entites/result_search.dart';
import 'package:github_search/modules/search/domain/errors/erros.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch,List<ResultSearch>>> search(String? searchText);
}