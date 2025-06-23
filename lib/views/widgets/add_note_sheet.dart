import 'package:flutter/material.dart';
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
    return Column(
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
              // Handle the save action, e.g., add the note to a list or database
              Navigator.pop(context);
            } else {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            }
          },
        ),
      ],
    );
  }
}
