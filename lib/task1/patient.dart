import 'package:flutter/material.dart';
import 'package:medrocket_task/task1/task1_colors.dart';
import 'package:medrocket_task/task1/task1_constants.dart';

class Patient extends StatelessWidget {
  final String name;

  Patient({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.person_2_outlined, color: Task1Colors.icon),
        const SizedBox(width: Task1Constants.iconTextMargin),
        Text(name, style: const TextStyle(fontSize: Task1Constants.payloadFontSize)),
      ],
    );
  }
}
