import 'package:flutter/material.dart';

class Nonots extends StatelessWidget {
  const Nonots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(
        'assets/images/create_note_image.png',
        width: MediaQuery.of(context).size.width * 0.75,
      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("You have no notes yet!\nStart Creating by pressing the + button below!",
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'poppins',
          fontWeight: FontWeight.bold,
         ),
        textAlign: TextAlign.center,
        ),
      ),
    ]
    );
  }
}