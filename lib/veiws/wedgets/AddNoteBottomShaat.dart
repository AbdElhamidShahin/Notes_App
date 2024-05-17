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
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextFeld(
              hintText: 'title',
            ),
            SizedBox(height: 16),
            CustomTextFeld(
              hintText: 'contend',
              maxLines: 5,
            ),
            SizedBox(height: 32),
            Custom_Buttom(),
            // SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
