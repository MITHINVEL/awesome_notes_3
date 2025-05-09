import 'package:awesome_notes/models/note.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:awesome_notes/change_notifers/notes_provider.dart';
import 'note_card.dart';

class NoteGrid extends StatefulWidget {
  final List<Note> notes;

  const NoteGrid({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  State<NoteGrid> createState() => _NoteGridState();
}

class _NoteGridState extends State<NoteGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, notesProvider, child) {
        final notes = notesProvider.notes;
        return GridView.builder(
          itemCount: notes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
          ),
          itemBuilder: (context, int index) {
            return Notecard(
              note: notes[index],
              isInGrid: true,
            );
          },
        );
      },
    );
  }
}
