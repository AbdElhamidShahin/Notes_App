import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noets_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:noets_app/cubit/add_note_cubit/add_note_state.dart';
import 'package:noets_app/modiel/notemodile.dart';
import 'package:noets_app/veiws/wedgets/CustomTextFeld.dart';

import 'CustomButtom.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(height: 32),
          BlocBuilder<AddNoteCubit, AddNotesState>(builder: (context, state) {
            return CustomButton(
              isLoding: state is AddNotesLoding ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var noteModel = Notemodile(
                    title: title!,
                    data: DateTime.now().toString(),
                    color: Colors.blue.value,
                    suptitle: subTitle!,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
