import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notes_cubit_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/custome_button.dart';
import 'package:notes_app/views/widgets/custome_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomeTextField(
              hintTitle: 'Title',
              maxLines: 1,
              textHeight: 0,
              onsaved: (value) {
                title = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomeTextField(
              maxLines: 5,
              hintTitle: 'Content',
              textHeight: 10,
              onsaved: (value) {
                subtitle = value;
              },
            ),
          ),
          SizedBox(height: 10),
          CustomeButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                var noteModel = NotesModel(
                  title: title!,
                  subTitle: subtitle!,
                  date: DateTime.now().toString(),
                  color: Colors.purple.value,
                );
                BlocProvider.of<NotesCubitCubit>(context).addNote(noteModel);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
