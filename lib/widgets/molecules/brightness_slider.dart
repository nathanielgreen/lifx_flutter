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
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: Theme.of(context).primaryColor,
        inactiveTrackColor: const Color(0xfff8edec),
        inactiveTickMarkColor: Theme.of(context).accentColor,
        thumbColor: Colors.white,
        trackHeight: 10,
      ),
      child: Slider(
        value: _currentBrightness,
        max: 100,
        divisions: 10,
        onChanged: (double value) {
          print(value);
          setState(() {
            _currentBrightness = value;
          });
        },
        onChangeEnd: widget.onChangeEnd,
      ),
    );
  }
}
