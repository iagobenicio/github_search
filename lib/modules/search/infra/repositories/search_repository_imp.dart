import 'package:github_search/modules/search/domain/errors/erros.dart';
import 'package:github_search/modules/search/domain/entites/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:github_search/modules/search/domain/repositories/search_repository.dart';
import 'package:github_search/modules/search/infra/datasource/search_datasource.dart';

class SearchRepositoryImp implements SearchRepository{

  final SearchDataSource dataSource;

  SearchRepositoryImp(this.dataSource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String? searchText) async{
    try {
      final result = await dataSource.getSearch(searchText!);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } 
    catch (e) {
      return Left(DataSourceError());
    }
  }


}  