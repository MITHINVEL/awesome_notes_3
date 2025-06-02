import 'package:awesome_notes/core/constant.dart';
import 'package:flutter/material.dart';

class NoteTag extends StatelessWidget {
  const NoteTag({
    required this.label,
    this.onClosed,
    super.key,
  });
 final String label;
 final VoidCallback ? onClosed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(106, 189, 184, 184),
      ),
      margin: const EdgeInsets.only(right: 8),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
             label,
              style: TextStyle(
                color: gray700,
                fontSize: onClosed != null ? 17:18,
              ),
            ),
        
            if (onClosed != null)
              GestureDetector(
                child: IconButton(
                  onPressed: onClosed,
                  icon: Icon(Icons.close, color: gray700,),
                  iconSize: 18,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}