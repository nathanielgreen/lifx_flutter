import 'package:flutter/material.dart';

BoxDecoration darkGradient() => const BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        0.1,
        0.4,
        0.6,
        0.9,
      ],
      colors: [
        Colors.yellow,
        Colors.red,
        Colors.indigo,
        Colors.teal,
      ],
    ));
