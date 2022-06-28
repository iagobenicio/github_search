import 'package:github_search/modules/search/domain/entites/result_search.dart';
import 'package:github_search/modules/search/domain/errors/erros.dart';

abstract class SearchBlocStates{}

class SearchSuccess implements SearchBlocStates{
  final List<ResultSearch> listresultSearch;
  SearchSuccess(this.listresultSearch);
}
class SearchStart implements SearchBlocStates{}
class SearchLoading implements SearchBlocStates{}

class SearchError implements SearchBlocStates{

  final FailureSearch error;

  SearchError(this.error);
  
}