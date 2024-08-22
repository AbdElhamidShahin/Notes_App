import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noets_app/veiws/wedgets/notes_vewe_body.dart';

import '../cubit/notes_cubit/Notes_Cupit.dart';
import 'wedgets/AddNoteBottomShaat.dart';

class Notes_view extends StatelessWidget {
  const Notes_view({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
          child: Icon(Icons.add),
        ),
        body: Notes_body(),
      ),
    );
  }
}
