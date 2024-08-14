import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:noets_app/constancs/constancs.dart';
import 'package:noets_app/cubit/add_note_cubit/add_note_state.dart';
import 'package:noets_app/modiel/notemodile.dart';

class AddNoteCubit extends Cubit<AddNotesState> {
  AddNoteCubit() : super(AddNotesInitial());

  addNote(Notemodile note) async {
    emit(AddNotesLoding());
    try {
      var notesBox = Hive.box<Notemodile>(kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(
        e.toString(),
      ));
    }
  }
}
