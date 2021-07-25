import 'package:flutter/material.dart';
import 'package:lifx/widgets/atoms/screen_header.dart';
import 'package:lifx/constants/style.dart';

AppBar topBar(String text) => AppBar(
      title: ScreenHeader(text: text),
      centerTitle: true,
      backgroundColor: CustomColors.canvas,
      elevation: 0,
    );
