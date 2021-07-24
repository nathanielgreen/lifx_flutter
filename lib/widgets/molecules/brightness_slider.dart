import 'package:flutter/material.dart';

class BrightnessSlider extends StatefulWidget {
  const BrightnessSlider({Key? key, required this.onChangeEnd})
      : super(key: key);

  final Function(double) onChangeEnd;

  @override
  State<BrightnessSlider> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double _currentBrightness = 100;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentBrightness,
      max: 100,
      divisions: 10,
      label: _currentBrightness.round().toString(),
      onChanged: (double value) => setState(() {
        _currentBrightness = value;
      }),
      onChangeEnd: widget.onChangeEnd,
    );
  }
}
