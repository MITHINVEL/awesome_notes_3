import 'package:flutter/material.dart';
import 'package:awesome_notes/widgets/note_card.dart';
class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: 11,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return Notecard(isInGrid: false);
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 4,
            ),
          ),
        ),
      ],
    );
  }
}


