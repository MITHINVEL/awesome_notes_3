// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:awesome_notes/core/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed; // Corrected type for onPressed

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.9),
            blurRadius: 1,
            offset: const Offset(5, 7),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onPressed, // Correctly uses the onPressed callback
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: black),
        ),
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}