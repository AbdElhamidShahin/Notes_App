import 'dart:ui';

import 'package:flutter/material.dart';

import 'CustomButtom.dart';
import 'CustomTextFeld.dart';

class AddNoteBottomShaat extends StatelessWidget {
  const AddNoteBottomShaat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled; //للتحقق من textFeld
  String? title, suptitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFeld(
            onSaved: (value) {
              title = value;
            },
            hintText: 'title',
          ),
          const SizedBox(height: 16),
          CustomTextFeld(
            onSaved: (value) {
              suptitle = value;//للتححق
            },
            hintText: 'contend',
            maxLines: 5,
          ),
          const SizedBox(height: 32),
          Custom_Buttom(
            onTap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          // SizedBox(height: 8),
        ],
      ),
    );
  }
}
