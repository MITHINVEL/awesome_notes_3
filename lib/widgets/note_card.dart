// ignore_for_file: deprecated_member_use

import 'package:awesome_notes/change_notifers/new_note_controler.dart';
import 'package:awesome_notes/change_notifers/notes_provider.dart';
import 'package:awesome_notes/core/constant.dart';
import 'package:awesome_notes/models/note.dart';
import 'package:awesome_notes/pages/new_or_edit_note_page.dart';
import 'package:awesome_notes/widgets/NoteTag.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Notecard extends StatelessWidget {
  const Notecard({
    required this.note,
    required this.isInGrid,
    super.key,
  });
  final Note note;
  final bool isInGrid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Open edit page with note data, wait for result
        final updatedNote = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<NewNoteControler>(
              create: (_) => NewNoteControler.fromNote(note),
              child: NewOrEditNotePage(isnewnote: false),
            ),
          ),
        );
        // If updatedNote is returned, update in provider
        if (updatedNote is Note) {
          final notesProvider = context.read<NotesProvider>();
          notesProvider.updateNote(updatedNote);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primary, width: 2),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'fredoka',
                      fontSize: 16,
                      color: gray900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        note.tags.length,
                        (index) => NoteTag(
                          label: note.tags[index],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                if (note.content != null) ...[
                  isInGrid
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              note.content is String
                                  ? note.content
                                  : note.content.toPlainText(),
                              style: TextStyle(
                                color: gray700,
                              ),
                            ),
                          ],
                        )
                      : Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            note.content is String
                                ? note.content
                                : note.content.toPlainText(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: gray700,
                            ),
                          ),
                        ),
                        
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('dd MMM y').format(DateTime.fromMillisecondsSinceEpoch(note.dateCreated)),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: gray900),
                          ),
                          SizedBox(width: 12), // Add spacing between date and delete icon
                          IconButton(
                            onPressed: () {
                              context.read<NotesProvider>().deleteNote(note);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

