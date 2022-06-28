// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

abstract class FailureSearch implements Exception{}

class InvalidName implements FailureSearch {}

class DataSourceError implements FailureSearch {
  final String? menssage;

  DataSourceError({
    this.menssage,
  });

  
}
