import 'package:awesome_notes/core/constant.dart';
import 'package:awesome_notes/widgets/new_tag_diolog.dart';
import 'package:flutter/material.dart';

class diologcard extends StatelessWidget {
  const diologcard({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.75,
          margin: MediaQuery.viewInsetsOf(context),
          child: Container(
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: black, width: 2),
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: NewTagDiolog(),
            ),

          ),
        ),
      ),
    );
  }
}

