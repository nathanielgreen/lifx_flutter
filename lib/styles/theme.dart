import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

ThemeData theme() => ThemeData(
      primaryColor: const Color(0xffe1d5c9),
      accentColor: const Color(0xffc29250),
      textTheme: TextTheme(
        headline1: GoogleFonts.sourceSansPro(),
      ),
    );
