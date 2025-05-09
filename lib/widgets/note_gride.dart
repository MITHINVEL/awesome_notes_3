import 'package:flutter/widgets.dart';
import 'note_card.dart';

 GridView notegrid() {
  return GridView.builder(
    itemCount: 11,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 7,
      crossAxisSpacing: 7,
    ),
    itemBuilder: (context, int index) {
      return Notecard(
        isInGrid: true);
    },
  );
}
  