import 'package:flutter/material.dart';
import 'package:medrocket_task/task1/task1_colors.dart';
import 'package:medrocket_task/task1/task1_constants.dart';

class Doctor extends StatelessWidget {
  final String doctor;

  Doctor(this.doctor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.medical_information_outlined, color: Task1Colors.icon),
        const SizedBox(width: Task1Constants.iconTextMargin),
        Text(
          doctor,
          style: TextStyle(fontSize: Task1Constants.payloadFontSize),
        ),
      ],
    );
  }
}
