import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_search/modules/search/domain/errors/erros.dart';
import 'package:github_search/modules/search/presenter/search_bloc.dart';
import 'package:github_search/modules/search/presenter/serach_page_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  final blocsearch = GetIt.instance.get<SearchBloc>();
  final textcontrol = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    blocsearch.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              
              decoration: const InputDecoration(
                label: Text("Search..."),
                border: OutlineInputBorder()
              ),
              controller: textcontrol,
              onChanged: blocsearch.add,
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: blocsearch.stream,
              builder: (context, snapshot) {
              
                final blocstate = blocsearch.state;
          
                if (blocstate is SearchStart) {
                  return const Center(
                    child: Text('Digite um texto...'),
                  );
                }
                if (blocstate is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (blocstate is SearchError) {
                  if (blocstate.error is InvalidName) {
                    return const Center(
                      child: Text('O nome está inválido'),
                    );
                  }
                  return const Center(
                    child: Text("Ocorreu um erro"),
                  );
                }
                final listresult = (blocstate as SearchSuccess).listresultSearch;
                return ListView.builder(
                    itemCount: listresult.length,
                    itemBuilder: (context,index){
                    final items = listresult[index];
                    return ListTile(
                      leading: items.image == null ? Container() :
                      CircleAvatar(
                        backgroundImage: NetworkImage(items.image!),
                      ),
                      title: Text(items.title ?? ""),
                      subtitle: Text(items.content.toString()),
                    );
                  }
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}