import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupHeader extends StatelessWidget {
  final String text;

  const GroupHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(top: 24, bottom: 12),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
}
