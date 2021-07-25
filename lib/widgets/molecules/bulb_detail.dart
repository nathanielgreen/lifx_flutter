import 'package:flutter/material.dart';

class BulbDetail extends StatelessWidget {
  final String label;
  final String value;

  const BulbDetail({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 40,
        width: 40,
        child: Card(
          child: Text("$label: $value"),
        ),
      );
}
