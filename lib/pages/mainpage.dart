// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names
import 'package:awesome_notes/change_notifers/new_note_controler.dart';
import 'package:awesome_notes/change_notifers/notes_provider.dart';
import 'package:awesome_notes/core/constant.dart';
import 'package:awesome_notes/models/note.dart';
import 'package:awesome_notes/pages/new_or_edit_note_page.dart';
import 'package:awesome_notes/widgets/no_notes.dart';

import 'package:awesome_notes/widgets/note_icon_button_outlined.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart'; // Ensure this is the correct path
import 'package:awesome_notes/widgets/note_gride.dart';
import 'package:awesome_notes/widgets/note_list.dart';
import 'package:awesome_notes/widgets/note_search.dart';
import 'package:awesome_notes/widgets/note_floatbutton.dart';
import 'package:provider/provider.dart';
 // Ensure this is the correct path
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> dropdownOptions = [
    "Date modified",
    "date created",
   
  ];

  late String dropdownValue = dropdownOptions.first;
 bool isDescending =  true;
 bool isgrid = true;
 String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: const Text(
          "Awesome Notes 📒",
          style: TextStyle(
            fontFamily: 'fredoka',
          ),
        ),
        actions: [
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.rightFromBracket, // Changed to IconData
              onPressed: () {
                // Add your onPressed logic here
              },
          )
        ],
      ),
      floatingActionButton: FloatButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) =>  ChangeNotifierProvider(
            create:(context)=>NewNoteControler(),
            child: NewOrEditNotePage(isnewnote: true)),
          ),
        );
      },),

      body: Consumer<NotesProvider>(
        builder: (context, notesProvider, child) {
          final List<Note> notes= notesProvider.notes;
          // Filter notes by searchQuery (case-insensitive, title contains query)
          final List<Note> filteredNotes = searchQuery.isEmpty
              ? notes
              : notes.where((note) => note.title.toLowerCase().contains(searchQuery.toLowerCase())).toList();
          return notes.isEmpty? Nonots(): Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              search_inputbox(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              SizedBox(height: 15,),
        
           
                    Row(
                      children: [
                        IconButton( icon:isDescending
                         ? FaIcon(FontAwesomeIcons.arrowDown)
                         : FaIcon(FontAwesomeIcons.arrowUp),
              onPressed: () {
                isDescending = !isDescending;
              },
                     
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              constraints: const BoxConstraints(),
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              iconSize: 25,
              color: gray700,
                        ),
                        const SizedBox(width: 10),
                        DropdownButton<String>(
              value: dropdownValue,
                        icon: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: FaIcon(FontAwesomeIcons.arrowDownWideShort,size: 18,
              color: gray700,),
                        ),
                        underline: SizedBox.shrink(),          
              isDense: true,
              items: dropdownOptions
                  .map((e) => DropdownMenuItem(
                  
                        value: e,
                        child:Row(
                          children: [
                            Text(e),
                            if (e == dropdownValue)
                              FaIcon(FontAwesomeIcons.check,size: 18,
                                color: primary,)
                         
                       ]
                       )
                      )
                      )
                  .toList(),
              selectedItemBuilder: (context) =>
                  dropdownOptions.map((e) => Text(e)).toList(),
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue.toString();
                  
                });
              },
                        ),
                        const Spacer(),
                        IconButton(
              icon: FaIcon(
                isgrid
                    ? FontAwesomeIcons.tableCellsLarge
                    : FontAwesomeIcons.bars,
                size: 30,
                color: gray700,
              ),
              onPressed: () {
                setState(() {
                  isgrid = !isgrid;
                });
              },
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              constraints: const BoxConstraints(),
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              iconSize: 25,
              color: gray700,
                        ),
                      ],
                    ),
                     SizedBox(height: 15,),
            Expanded(
              child: isgrid ? NoteGrid(notes: filteredNotes) 
              :NotesList(notes: filteredNotes,),
            )
            ],
          ),
        
        );
        }
      )
    );
  
}

 


}


