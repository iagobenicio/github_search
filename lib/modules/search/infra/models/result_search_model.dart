import 'dart:convert';
import 'package:github_search/modules/search/domain/entites/result_search.dart';

class ResultSearchModel extends ResultSearch {
  
  final String? title;
  final int? content;
  final String? image;

  ResultSearchModel({this.title, this.content, this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': title,
      'id': content,
      'avatar_url': image,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['login'] != null ? map['login'] as String : null,
      content: map['id'] != null ? map['id'] as int : null,
      image: map['avatar_url'] != null ? map['avatar_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) => ResultSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
