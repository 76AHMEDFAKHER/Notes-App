import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/views/widgets/add_note_sheet.dart';

class AddBottomSheeet extends StatelessWidget {
  AddBottomSheeet({super.key, this.isLoading = false});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {
        Navigator.pop(context);
      },
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 37, 36, 36),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: BlocConsumer<NotesCubitCubit, NotesCubitState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: isLoading,
                    child: AddNoteForm(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
