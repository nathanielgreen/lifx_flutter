import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHeader extends StatelessWidget {
  final String text;

  const ScreenHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 24, bottom: 12),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}
