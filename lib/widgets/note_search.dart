// ignore_for_file: non_constant_identifier_names

import 'package:awesome_notes/core/constant.dart';
import 'package:flutter/material.dart';

TextField search_inputbox({void Function(String)? onChanged}) {
  return TextField(
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: "Search notes...",
      hintStyle: TextStyle(fontSize: 17),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.search, size: 25),
      ),
      fillColor: white,
      filled: true,
      isDense: true,
      contentPadding: EdgeInsets.zero,
      prefixIconConstraints: BoxConstraints(
        minHeight: 30,
        maxWidth: 30,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: const Color.fromARGB(255, 238, 241, 3)),
      ),
    ),
  );
}


