import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custome_appbar.dart';

import 'package:notes_app/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
          child: CustomeAppbar(),
        ),

        Expanded(child: NotesListView()),
      ],
    );
  }
}
