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
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                "$label: ",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      );
}
