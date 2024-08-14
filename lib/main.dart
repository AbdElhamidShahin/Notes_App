import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noets_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:noets_app/simpel_Bloc_Observer.dart';
import 'package:noets_app/veiws/notes_veiw.dart';
import 'constancs/constancs.dart';
import 'modiel/notemodile.dart';

void main() async {
  // Initialize Hive and the Flutter Hive plugin
  await Hive.initFlutter();

  // Register the adapter before opening any box
  Hive.registerAdapter(NotemodileAdapter());

  // Open the box after registering the adapter
  await Hive.openBox<Notemodile>(kNotesBox);

  // Set up Bloc observer
  Bloc.observer = SimpelBlocObserverle();

  // Run the app
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
