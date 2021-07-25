import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightSwitch extends StatelessWidget {
  const LightSwitch({
    Key? key,
    required this.id,
    required this.text,
    required this.onClick,
    required this.onToggle,
    required this.power,
  }) : super(key: key);

  final String id;
  final String text;
  final Function() onClick;
  final Function(bool) onToggle;
  final bool power;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20, color: Colors.blue),
            primary: Colors.white,
            shadowColor: const Color(0xffeeeeee),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          onPressed: onClick,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(text,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )),
                  Text(
                    "ID: $id",
                    style: GoogleFonts.sourceSansPro(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ]),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    activeColor: Theme.of(context).primaryColor,
                    inactiveThumbColor: Theme.of(context).accentColor,
                    value: power,
                    onChanged: onToggle,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
