import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:noets_app/veiws/notes_veiw.dart';

import 'constancs/constancs.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
      ),
      home: const Notes_view(),
    );
  }
}
