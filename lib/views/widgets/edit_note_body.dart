import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/widgets/custome_appbar.dart';
import 'package:notes_app/views/widgets/custome_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
          child: CustomeAppbar(icon: FontAwesomeIcons.check),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomeTextField(
            hintTitle: 'title',
            maxLines: 1,
            textHeight: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomeTextField(
            hintTitle: 'Content',
            maxLines: 10,
            textHeight: 1.5,
          ),
        ),
      ],
    );
  }
}
