import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/cubit/notes_list_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  final NotesModel note;
  const NotesItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: note);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.01,
        ),
        height: screenHeight * 0.17,
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(note.title, style: TextStyle(color: Colors.white)),
              subtitle: Text(
                note.subTitle,
                style: TextStyle(color: Colors.white70),
              ),
              trailing: IconButton(
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesListCubit>(
                    context,
                    listen: false,
                  ).fetchNotes();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Note deleted successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Text.rich(TextSpan(text: note.date)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
