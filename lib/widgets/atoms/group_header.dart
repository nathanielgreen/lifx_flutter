import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupHeader extends StatelessWidget {
  final String text;
  final Alignment alignment;

  const GroupHeader({
    Key? key,
    required this.text,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: alignment,
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: const Color(0xff949494),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
}
