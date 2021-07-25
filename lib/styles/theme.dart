import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:lifx/constants/style.dart';

ThemeData theme() => ThemeData(
      canvasColor: CustomColors.canvas,
      primaryColor: CustomColors.primary,
      accentColor: CustomColors.canvas,
      textTheme: TextTheme(
        headline1: GoogleFonts.sourceSansPro(),
      ),
    );
