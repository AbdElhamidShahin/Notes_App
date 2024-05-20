import 'package:flutter/material.dart';
import 'package:noets_app/veiws/wedgets/notes_vewe_body.dart';

import 'wedgets/AddNoteBottomShaat.dart';

class Notes_view extends StatelessWidget {
  const Notes_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: Icon(Icons.add),
      ),
      body: Notes_body(),
    );
  }
}
