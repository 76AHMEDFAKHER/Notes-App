import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/model/notes_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());

  addNote(NotesModel note) async {
    // emit(NotesCubitLoading());
    try {
      var notesHiveBox = Hive.box<NotesModel>(
        notesBox,
      ); // just get the box, don't open
      await notesHiveBox.add(note);
      emit(NotesCubitSucces(notesHiveBox.values.toList()));
      log('Note added successfully: ${note.title}');
    } catch (e, stack) {
      log('Error adding note: $e');
      log('Stack trace: $stack');
      emit(NotesCubitError(e.toString()));
    }
  }
}
