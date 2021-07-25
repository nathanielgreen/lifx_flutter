import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:lifx/constants/style.dart';

ThemeData theme() => ThemeData(
      canvasColor: CustomColors.paleYellow,
      primaryColor: CustomColors.paleOrange,
      accentColor: CustomColors.brown,
      textTheme: TextTheme(
        headline1: GoogleFonts.sourceSansPro(),
      ),
    );
