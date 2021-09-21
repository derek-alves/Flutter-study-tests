import 'package:tests/person.dart';

abstract class PersonState {}

class PersonListState extends PersonState {
  final List<Person> data;

  PersonListState({required this.data});
}

class PersonLoadingState extends PersonState {}

class PersonErrorState extends PersonState {
  final dynamic error;

  PersonErrorState({this.error});
}
