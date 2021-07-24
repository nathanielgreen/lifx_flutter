import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

ThemeData theme() => ThemeData(
      primaryColor: Colors.blueGrey.shade800,
      accentColor: const Color(0xff4f6fec),
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline1: GoogleFonts.sourceSansPro(),
      ),
    );
