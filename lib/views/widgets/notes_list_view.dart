import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_list_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure notes are fetched at least once
    Future.microtask(() =>
      BlocProvider.of<NotesListCubit>(context, listen: false).fetchNotes()
    );

    return BlocBuilder<NotesListCubit, NotesListState>(
      builder: (context, state) {
        List<NotesModel> notes =
            BlocProvider.of<NotesListCubit>(context).notes ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NotesItem(note: notes[index]);
          },
          itemCount: notes.length,
        );
      },
    );
  }
}
