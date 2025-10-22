import 'package:flutter/material.dart';
import 'package:medrocket_task/task1/model/clinic_entity.dart';
import 'package:medrocket_task/task1/task1_colors.dart';
import 'package:medrocket_task/task1/task1_constants.dart';

class Clinic extends StatelessWidget {
  final ClinicEntity clinic;

  Clinic({Key? key, required this.clinic})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.local_hospital_outlined, color: Task1Colors.icon),
        const SizedBox(width: Task1Constants.iconTextMargin),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Клиника \u00AB${clinic.name}\u00BB",
              style: TextStyle(fontSize: Task1Constants.payloadFontSize),
            ),
            Text(
              clinic.address,
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
