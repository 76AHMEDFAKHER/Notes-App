import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/model/notes_model.dart';

part 'notes_list_state.dart';

class NotesListCubit extends Cubit<NotesListState> {
  NotesListCubit() : super(NotesListInitial());
  List<NotesModel>? notes;

  fetchNotes() {
    var notesHiveBox = Hive.box<NotesModel>(notesBox);
    notes = notesHiveBox.values.toList();
    emit(NotesListSuccess(notes!));
  }
}
