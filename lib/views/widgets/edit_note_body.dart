import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/cubit/notes_list_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/custome_appbar.dart';
import 'package:notes_app/views/widgets/custome_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});
  final NotesModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
          child: CustomeAppbar(
            icon: FontAwesomeIcons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesListCubit>(
                context,
                listen: false,
              ).fetchNotes();
              Navigator.pop(context);
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomeTextField(
            onChanged: (value) {
              title = value;
            },
            hintTitle: widget.note.title,
            maxLines: 1,
            textHeight: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomeTextField(
            onChanged: (value) {
              content = value;
            },
            hintTitle: widget.note.subTitle,
            maxLines: 10,
            textHeight: 1.5,
          ),
        ),
      ],
    );
  }
}
