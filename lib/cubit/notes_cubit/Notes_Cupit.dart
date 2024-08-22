import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:noets_app/constancs/constancs.dart';
import 'package:noets_app/cubit/add_note_cubit/add_note_state.dart';
import 'package:noets_app/cubit/notes_cubit/Notes_State.dart';
import 'package:noets_app/modiel/notemodile.dart';

class NoteCubit extends Cubit<NotesState> {
  NoteCubit() : super(NotesInitial());

  fetchAllNotes() async {
    try {
      var notesBox = Hive.box<Notemodile>(kNotesBox);
      List<Notemodile> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailure(
        e.toString(),
      ));
    }
  }
}
