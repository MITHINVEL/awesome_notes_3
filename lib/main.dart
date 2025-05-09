import 'package:awesome_notes/change_notifers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notes/core/constant.dart';
import 'package:awesome_notes/pages/mainpage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> NotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awesome Notes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'poppins',
          scaffoldBackgroundColor: background,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(0, 10, 10, 10),
            titleTextStyle: TextStyle(
              color: primary,
              fontSize: 30,
              fontFamily: 'fredoka',
              fontWeight: FontWeight.bold,
            ),
            
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FlutterQuillLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English
          // Add other supported locales here
        ],
        home: const MyHomePage(),
      ),
    );
  }
}

