import 'dart:convert';
import 'dart:ffi';

import 'package:awesome_notes/change_notifers/notes_provider.dart';
import 'package:awesome_notes/models/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

class NewNoteControler extends ChangeNotifier {
  bool _readOnly = false;
  set readOnly(bool value) {
    _readOnly = value;
    notifyListeners();
  }
  bool get readOnly => _readOnly;

  String _title='';
  set title(String value) {
    _title = value;
    notifyListeners();
  }
  String get title => _title.trim();
  Document _content = Document();
  set content(Document value) {
    _content = value;
    notifyListeners();
  }
  Document get content => _content;
  List<String> _tags = [];
   void addTag(String tag) {
    _tags.add(tag);
    notifyListeners();
   }
   List<String> get tags => [..._tags];

   void removeTag(int index) {
    _tags.removeAt(index);
    notifyListeners();
   }
   bool get cansaveNote{
    final String? newTitle = title.isEmpty ? title:null;
    final String? newContent = content.toPlainText().trim().isNotEmpty
    ? content.toPlainText().trim() : null;
    return newTitle != null || newContent != null;
   }

   int _dateCreated = DateTime.now().millisecondsSinceEpoch;
   int get dateCreated => _dateCreated;
   int _dateModified = DateTime.now().millisecondsSinceEpoch;
   int get dateModified => _dateModified;

   void saveNote(BuildContext context){
    final String contentJson = jsonEncode(_content.toDelta().toJson());
    final int now =  DateTime.now().millisecondsSinceEpoch;
    _dateModified = now;
    final Note note = Note(
      title: title,
      content: content,
      contentJson: contentJson,
      dateCreated: _dateCreated,
      dateModified: _dateModified,
      tags: tags,
    );
    context.read<NotesProvider>().addNote(note);
  }

  Note getNoteForEdit() {
    final String contentJson = jsonEncode(_content.toDelta().toJson());
    final int now = DateTime.now().millisecondsSinceEpoch;
    _dateModified = now;
    return Note(
      title: title,
      content: content,
      contentJson: contentJson,
      dateCreated: _dateCreated,
      dateModified: _dateModified,
      tags: tags,
    );
  }

  bool canSaveNote() {
    return title.isNotEmpty;
  }

  NewNoteControler();
  factory NewNoteControler.fromNote(Note note) {
    final controller = NewNoteControler();
    controller._title = note.title;
    controller._content = note.content is Document ? note.content : Document.fromJson(jsonDecode(note.contentJson));
    controller._tags = List<String>.from(note.tags);
    controller._dateCreated = note.dateCreated;
    controller._dateModified = note.dateModified;
    return controller;
  }
}