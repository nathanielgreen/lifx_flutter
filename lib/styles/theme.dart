import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

ThemeData theme() => ThemeData(
      canvasColor: const Color(0xfffeede5),
      primaryColor: const Color(0xfff6b590),
      accentColor: const Color(0xff917b7d),
      textTheme: TextTheme(
        headline1: GoogleFonts.sourceSansPro(),
      ),
    );
