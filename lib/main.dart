import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noets_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:noets_app/simpel_Bloc_Observer.dart';

import 'package:noets_app/veiws/notes_veiw.dart';

import 'constancs/constancs.dart';
import 'modiel/notemodile.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer =SimpelBlocObserverle();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NotemodileAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
        ),
        home: const Notes_view(),
      ),
    );
  }
}
