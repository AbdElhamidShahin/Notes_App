import 'package:noets_app/modiel/notemodile.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoding extends NotesState {}

class NotesSuccess extends NotesState {
  final List<Notemodile> notes;

  NotesSuccess(this.notes);
}

class NotesFailure extends NotesState {
  final String? errormassege;

  NotesFailure(String string, { this.errormassege});
}
