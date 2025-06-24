import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/cubits/cubit/notes_list_cubit.dart';
import 'package:notes_app/views/widgets/add_note_sheet.dart';

class AddBottomSheeet extends StatefulWidget {
  const AddBottomSheeet({super.key});

  @override
  State<AddBottomSheeet> createState() => _AddBottomSheeetState();
}

class _AddBottomSheeetState extends State<AddBottomSheeet> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 37, 36, 36),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BlocProvider(
            create: (context) => NotesCubitCubit(),
            child: BlocConsumer<NotesCubitCubit, NotesCubitState>(
              listener: (context, state) {
                if (state is NotesCubitSucces) {
                  BlocProvider.of<NotesListCubit>(
                    context,
                    listen: false,
                  ).fetchNotes();
                  Navigator.pop(context);
                } else if (state is NotesCubitError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: AddNoteForm(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
