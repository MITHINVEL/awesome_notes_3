import 'package:awesome_notes/models/note.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier{
  final List<Note> _notes = [];
  List <Note> get notes => [..._notes];
  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }
  void updateNote(Note updatedNote) {
    final index = _notes.indexWhere((n) => n.dateCreated == updatedNote.dateCreated);
    if (index != -1) {
      _notes[index] = updatedNote;
      notifyListeners();
    }
  }
  void deleteNote(Note note) {
    _notes.removeWhere((n) => n.dateCreated == note.dateCreated);
    notifyListeners();
  }
}