 import 'package:app_contatos/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 20), // Defina o tamanho de fonte desejado
        ),
      ),
      home:   MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
