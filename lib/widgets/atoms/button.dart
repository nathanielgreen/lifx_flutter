import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onClick;

  const Button({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          primary: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Text(text, style: const TextStyle(color: Colors.black))),
      );
}
