import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tests/bloc/person_bloc.dart';
import 'package:tests/bloc/person_state.dart';
import 'package:tests/person.dart';
import 'package:tests/person_repository.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  final repository = PersonRepositoryMock();
  final bloc = PersonBloc(repository, PersonLoadingState());

  final person = Person(age: 21, height: 40, id: 2, name: "Derek", weight: 50);

  test('should be return list of person', () async {
    when(() => repository.getPerson()).thenAnswer((_) async => <Person>[
          person,
          person,
        ]);

    bloc.add(PersonEvent.fetch);

    await expectLater(
        bloc.state,
        emitsInOrder([
          isA<PersonLoadingState>(),
          isA<PersonListState>(),
        ]));
  });
}
