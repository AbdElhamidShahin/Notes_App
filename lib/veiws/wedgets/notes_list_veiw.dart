import 'package:flutter/material.dart';

import 'notes_item.dart';

class notes_list_weiw extends StatelessWidget {
  const notes_list_weiw({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: NoteItem(),
            );
          }),
    );
  }
}
