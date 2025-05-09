// ignore_for_file: file_names, deprecated_member_use

import 'package:awesome_notes/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
class NoteToolbar extends StatelessWidget {
  const NoteToolbar({
    super.key,
    required QuillController controller,
  }) : _controller = controller;

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
       clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: primary,
        strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.8),
      
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: QuillSimpleToolbar(
          controller: _controller,         
          config: QuillSimpleToolbarConfig(
            multiRowsDisplay: false,
            showFontFamily: false,
            showFontSize: false,
            showSubscript: false,
            showSuperscript: false,
            showSmallButton: false,
            showInlineCode: false,
            showAlignmentButtons: false,
            showDirection: false,
            showDividers: false,
            showHeaderStyle: false,
            showListCheck: false,
            showCodeBlock: false,
            showQuote: false,
            showIndent: false,
            showLink: false,
            buttonOptions: QuillSimpleToolbarButtonOptions(
              undoHistory: QuillToolbarHistoryButtonOptions(
                iconData: FontAwesomeIcons.arrowRotateLeft,
                iconSize: 15,
              ),
              redoHistory: QuillToolbarHistoryButtonOptions(
                iconData: FontAwesomeIcons.arrowRotateRight,
                iconSize: 15,
              ),
              bold: QuillToolbarToggleStyleButtonOptions(
                iconData: FontAwesomeIcons.bold,
                iconSize: 15,
              ),
              italic: QuillToolbarToggleStyleButtonOptions(
                iconData: FontAwesomeIcons.italic,
                iconSize: 15,
              ),
              underLine: QuillToolbarToggleStyleButtonOptions(
                iconData: FontAwesomeIcons.underline,
                iconSize: 15,
              ),
              strikeThrough: QuillToolbarToggleStyleButtonOptions(
                iconData: FontAwesomeIcons.strikethrough,
                iconSize: 15,
              ),
              color: QuillToolbarColorButtonOptions(
                iconData: FontAwesomeIcons.palette,
                iconSize: 15,
              ),
              backgroundColor: QuillToolbarColorButtonOptions(
                iconData: FontAwesomeIcons.fillDrip,
                iconSize: 15,
              ),
              clearFormat: QuillToolbarClearFormatButtonOptions(
                iconData: FontAwesomeIcons.textSlash,
                iconSize: 15,
              ),
              listNumbers: QuillToolbarToggleStyleButtonOptions(
                iconData: FontAwesomeIcons.listOl,
                iconSize: 15,
              ),
              listBullets: QuillToolbarToggleStyleButtonOptions(
                iconData: FontAwesomeIcons.listUl,
                iconSize: 15,
              ),
              search: QuillToolbarSearchButtonOptions(
                iconData: FontAwesomeIcons.magnifyingGlass,
                iconSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}