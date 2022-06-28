import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:github_search/modules/search/external/datasource/github_datasource.dart';


class DioMock extends Mock implements Dio{}


void main() {

  final dio = DioMock();
  final datasource = GithubDataSource(dio);

  test("deve retornar uma lista de ResultSearchModel", ()async{

    when(() => dio.get(any())).thenAnswer((_) async => Response(
      requestOptions: RequestOptions(path: ""),
      data: jsonDecode(data), 
      statusCode: 200
      )
    );

    final result = datasource.getSearch("iago");
    expect(result, completes);
  });
}
const data = 
"""
{
  "total_count": 2668,
  "incomplete_results": false,
  "items": [
    {
      "login": "iago",
      "id": 6692103,
      "node_id": "MDQ6VXNlcjY2OTIxMDM=",
      "avatar_url": "https://avatars.githubusercontent.com/u/6692103?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/iago",
      "html_url": "https://github.com/iago",
      "followers_url": "https://api.github.com/users/iago/followers",
      "following_url": "https://api.github.com/users/iago/following{/other_user}",
      "gists_url": "https://api.github.com/users/iago/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/iago/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/iago/subscriptions",
      "organizations_url": "https://api.github.com/users/iago/orgs",
      "repos_url": "https://api.github.com/users/iago/repos",
      "events_url": "https://api.github.com/users/iago/events{/privacy}",
      "received_events_url": "https://api.github.com/users/iago/received_events",
      "type": "User",
      "site_admin": false,
      "score": 1.0
    }
  ]
}
""";