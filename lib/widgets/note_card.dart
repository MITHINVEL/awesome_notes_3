// ignore_for_file: deprecated_member_use

import 'package:awesome_notes/core/constant.dart';
import 'package:awesome_notes/models/note.dart';
import 'package:awesome_notes/pages/new_or_edit_note_page.dart';
import 'package:flutter/material.dart';
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
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => const NewOrEditNotePage(isnewnote: false),
      )),
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "This is going to be a title",
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
                      3,
                      (index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(106, 189, 184, 184),
                        ),
                        margin: const EdgeInsets.only(right: 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "  First chip  ",
                            style: TextStyle(
                              color: gray700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              if (isInGrid)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Some Content",
                      style: TextStyle(
                        color: gray700,
                      ),
                    ),
                  ],
                )
              else
                Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Some Content",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: gray700,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "02 Nov, 2023",
                        style: TextStyle(
                          color: gray700,
                          fontSize: 15,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}