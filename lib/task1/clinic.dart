import 'package:flutter/material.dart';
import 'package:medrocket_task/task1/task1_colors.dart';
import 'package:medrocket_task/task1/task1_constants.dart';

class Clinic extends StatelessWidget {
  String name;
  String address;

  Clinic({Key? key, required this.name, required this.address})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.local_hospital_outlined, color: Task1Colors.icon),
        SizedBox(width: Task1Constants.iconTextMargin),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Клиника \u00AB$name\u00BB",
              style: TextStyle(fontSize: Task1Constants.payloadFontSize),
            ),
            Text(
              address,
              style: TextStyle(
                color: Task1Colors.metadata,
                fontSize: Task1Constants.metadataPayloadFontSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
