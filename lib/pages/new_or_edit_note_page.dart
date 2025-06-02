// ignore_for_file: depend_on_referenced_packages, annotate_overrides

import 'package:awesome_notes/change_notifers/new_note_controler.dart';
import 'package:awesome_notes/core/constant.dart';
import 'package:awesome_notes/widgets/NoteTag.dart';
import 'package:awesome_notes/widgets/Note_toolbar.dart';
import 'package:awesome_notes/widgets/dialog_card.dart';
import 'package:awesome_notes/widgets/new_tag_diolog.dart';
import 'package:awesome_notes/widgets/note_icon_button_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;
import 'package:provider/provider.dart';

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
  late final NewNoteControler newNoteControler; 
  late final FocusNode focusNode;
 
  @override
  void initState() {
    super.initState();
    newNoteControler = context.read<NewNoteControler>();
    _controller = QuillController.basic()..addListener((){
        newNoteControler.content = _controller.document;
    });
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isnewnote) {
        focusNode.requestFocus();
        newNoteControler.readOnly = false;
      } else {
        newNoteControler.readOnly = true;
      }
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Selector<NewNoteControler, bool>(
              selector: (context, newNoteControler) => newNoteControler.readOnly,
              builder: (context, readOnly, child) => Padding(
                padding: const EdgeInsets.all(8.0),
              child: NoteIconButtonOutlined(
                icon:  readOnly ? FontAwesomeIcons.pen: FontAwesomeIcons.bookOpen, // Changed to IconData
                onPressed: () {
               
                    newNoteControler.readOnly=!readOnly;
                   
                  if(newNoteControler.readOnly){
                    FocusScope.of(context).unfocus();
                  }
                  else{
                    focusNode.requestFocus();
                  } 
                  
                
                },
              ),
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Selector<NewNoteControler, bool>(
              selector: (context, controller) => controller.readOnly,
              builder: (context, readOnly, child) => NoteIconButtonOutlined(
                icon: FontAwesomeIcons.check,
                onPressed: !readOnly
                    ? () {
                        newNoteControler.saveNote(context);
                        Navigator.of(context).pop();
                      }
                    : () {}, // Provide a non-null (but empty) function when disabled
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            Selector<NewNoteControler,bool>(
              selector: (context, controller) => controller.readOnly,
              builder: (context, read, child) =>
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
                     canRequestFocus: !read,
                     onChanged: (value) => newNoteControler.title = value,
                    enabled: !read,
              ),
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
                              fontWeight: FontWeight.bold, color: gray500,
                              fontSize: 20)),
                      IconButton(
                          icon: Icon(FontAwesomeIcons.circlePlus),
                          onPressed: () async{
                           final tag= await showDialog<String?>(
                              context: context,
                              builder: (context) => diologcard(child: NewTagDiolog(),),
                            );
                      if (tag != null ) {
                            newNoteControler.addTag(tag);
                          }
                        }
                          )
                    ],
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Selector<NewNoteControler,List<String>>(
                      selector: (_,newNoteControler) => newNoteControler.tags,
                      builder: (_, tags, __) => tags.isEmpty ? 
                      Text(
                        'No tags added',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                             fontSize: 16,
                             color: gray900),
                             ):SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                               child: Row(
                                children: [
                                  ...List.generate(tags.length,
                                   (index)=>NoteTag(label:tags[index],onClosed: (){
                                    newNoteControler.removeTag(index);
                                   },))
                                ],
                               ),
                             )
                    ),
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
          Selector<NewNoteControler, bool>(
            selector: (context, controller) => controller.readOnly,
            builder: (context, readOnly, child) => 
              !readOnly
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: NoteToolbar(controller: _controller),
                  )
                : SizedBox.shrink(),
          ),
          Expanded(
            child: Selector<NewNoteControler,bool>(
              selector: (context, controller) => controller.readOnly, 
              builder: (context, readOnly, child) =>
               Column(
                children: [
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
                ),
              ],
            ),
            )
          ),
        ], // <-- This closes the children: [ of the Column
      ), // <-- This closes the Column
    ), // <-- This closes the Padding
  ); // <-- This closes the Scaffold
}

}