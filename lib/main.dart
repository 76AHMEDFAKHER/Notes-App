import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/cubits/cubit/notes_list_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  ////This is the command to generate the adapter
  ////make sure to use the build_runner package in dev_dependencies in pubspec.yaml
  ////and hive_generator
  //// use the 'part' directive in your model class
  // flutter packages pub run build_runner build
  //
  try {
    await Hive.initFlutter();
    Bloc.observer = SimpleBlocObserver();
    Hive.registerAdapter(NotesModelAdapter());
    await Hive.openBox<NotesModel>(notesBox);
  } catch (e, stack) {
    log('Error initializing Hive: $e');
    log('Stack trace: $stack');
  }
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesListCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData.dark(),
        home: NotesView(),
      ),
    );
  }
}
