import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/cubit/notes_list_cubit.dart';
import 'package:notes_app/views/widgets/add_bottom_sheeet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        focusColor: const Color.fromARGB(255, 0, 0, 0),
        splashColor: Colors.black87,
        backgroundColor: Colors.blueAccent,

        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const AddBottomSheeet();
            },
          );
        },
        child: Icon(FontAwesomeIcons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
