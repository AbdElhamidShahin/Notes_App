import 'package:flutter/material.dart';
import 'package:noets_app/veiws/wedgets/costom_appbar.dart';

import 'CustomTextFeld.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          costom_appbar(
            icon: Icons.check,
            title: "Edit Note",
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomTextFeld(
            hintText: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTextFeld(
            hintText: 'content',
            maxLines: 5,
          ),
        ]),
      ),
    );
  }
}
