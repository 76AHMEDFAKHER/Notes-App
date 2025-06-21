import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.01,
      ),
      height: screenHeight * 0.17,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'This Flutter Notes',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Note Description is here',
              style: TextStyle(color: Colors.white70),
            ),
            trailing: IconButton(
              icon: Icon(
                FontAwesomeIcons.trash,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),

              onPressed: () {
                // Handle delete action
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Text.rich(TextSpan(text: '6/20/2025')),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'Last Updated at: 6/20/2025',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
