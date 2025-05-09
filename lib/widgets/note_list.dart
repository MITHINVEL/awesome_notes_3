import 'package:awesome_notes/models/note.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notes/widgets/note_card.dart';
class NotesList extends StatefulWidget {
  const NotesList({
    required this.notes,
    super.key
  });
   final List<Note> notes;

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
            itemCount: widget.notes.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return Notecard(
                isInGrid: false,
                 note: widget.notes[index]);
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


