

abstract class AddNotesState {}

class AddNotesInitial extends AddNotesState {}

class AddNotesLoding extends AddNotesState {}

class AddNotesSuccess extends AddNotesState {}

class AddNotesFailure extends AddNotesState {
  final String errormassege;

  AddNotesFailure(String string, {  required this.errormassege});


}
