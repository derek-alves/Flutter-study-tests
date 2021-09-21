import 'package:bloc/bloc.dart';
import 'package:tests/bloc/person_state.dart';
import 'package:tests/person_repository.dart';

enum PersonEvent { clear, fetch }

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository repository;
  PersonBloc(
    this.repository,
    PersonState initialState,
  ) : super(PersonLoadingState());

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if (event == PersonEvent.clear) {
      yield PersonListState(data: []);
    } else if (event == PersonEvent.fetch) {
      try {
        final list = await repository.getPerson();
        yield PersonListState(data: list);
      } catch (e) {
        yield PersonErrorState(error: e);
      }
    }
  }
}
