import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noets_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:noets_app/cubit/add_note_cubit/add_note_state.dart';

import 'AddNoteForm.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child:
          BlocConsumer<AddNoteCubit, AddNotesState>(listener: (context, state) {
        if (state is AddNotesFailure) {
          print('falidate ${state.errormassege}');
        }
        if (state is AddNotesSuccess) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddNotesLoding ? true : false,
            child: SingleChildScrollView(child: AddNoteForm()));
      }),
    );
  }
}
