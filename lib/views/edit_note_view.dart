import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/edit_note_body.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({super.key, required this.note});
  final NotesModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteBody(note: note));
  }
}
