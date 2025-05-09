// ignore_for_file: depend_on_referenced_packages, annotate_overrides

import 'package:awesome_notes/core/constant.dart';
import 'package:awesome_notes/widgets/Note_toolbar.dart';
import 'package:awesome_notes/widgets/note_icon_button_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;

class NewOrEditNotePage extends StatefulWidget {
  const NewOrEditNotePage({
    required this.isnewnote,
    super.key});

 final bool isnewnote ;


  @override
  State<NewOrEditNotePage> createState() => _NewOrEditNotePageState();
}

class _NewOrEditNotePageState extends State<NewOrEditNotePage> {
  QuillController _controller = QuillController.basic();
  late final FocusNode focusNode;
  late bool readOnly;
  @override
  void initState() {
    super.initState();
  
    _controller = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
    
    );
     focusNode = FocusNode();
     if (widget.isnewnote){
       focusNode.requestFocus();
       readOnly = false;
     }
     else{
      readOnly=true;
     }
  }
  @override
  void dispose() {
    _controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Notes',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NoteIconButtonOutlined(
              icon: FontAwesomeIcons.chevronLeft,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            widget.isnewnote
                ? "New Note"
                : "Edit Note",
            
            style: const TextStyle(
              fontFamily: 'poppins',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: NoteIconButtonOutlined(
                icon: readOnly ? FontAwesomeIcons.pen: FontAwesomeIcons.bookOpen, // Changed to IconData
                onPressed: () {
                  setState(() {
                    readOnly=! readOnly;
                  if(readOnly){
                    FocusScope.of(context).unfocus();
                  }
                  else{
                    focusNode.requestFocus();
                  } 
                  });
                
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NoteIconButtonOutlined(
                icon: FontAwesomeIcons.check, // Changed to IconData
                onPressed: () {
                  // Add your onPressed logic here
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                    ),
                decoration: InputDecoration(
                    hintText: "Title here", 
                    border: InputBorder.none
                    ),
                     canRequestFocus: !readOnly,
              ),
              if (!widget.isnewnote)
              ...[
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Last modified',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: gray500),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '07 Aiprel 2025, 03:45 PM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                           fontSize: 16,
                           color: gray900),),
                    ),
                  
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text('Created',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: gray500))),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '05 Aiprel 2025, 03:45 PM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                           fontSize: 16,
                           color: gray900),
                       
                    ),
                  ),
                ],
              ),
              ],
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Text('Tags',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: gray500)),
                        IconButton(
                            icon: Icon(FontAwesomeIcons.circlePlus),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Text(
                        'No tags added',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                             fontSize: 16,
                             color: gray900),),
                      )
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: gray500,
                  thickness: 2,
                ),
              ),
             if (!readOnly) Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: NoteToolbar(controller: _controller),
              ),
              Expanded(
                child: QuillEditor.basic(
                  controller: _controller,
                  config:  QuillEditorConfig(
                      placeholder: 'Note here...', 
                      expands: true,
                     checkBoxReadOnly: readOnly
                     // Corrected to use 'readOnly' instead of 'enabled'
                      ),
                      focusNode: focusNode,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

