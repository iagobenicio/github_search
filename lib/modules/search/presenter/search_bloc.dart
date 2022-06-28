import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:github_search/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search/modules/search/presenter/serach_page_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<String,SearchBlocStates>{

  SearchByText usecase;

  SearchBloc(this.usecase) : super(SearchStart()){

    on<String>((event,emit)async{
      emit(SearchLoading());
      final result = await usecase(event);
      emit(result!.fold((l) => SearchError(l), (r) => SearchSuccess(r)));
    },
    transformer: (events, mapper) => events.debounceTime(const Duration(milliseconds: 800)).asyncExpand(mapper),
    );

    

  } 
  

}