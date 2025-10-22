import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String textPage;

  const TextHeader({Key? key, required this.textPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(textPage, style: const TextStyle(fontWeight: FontWeight.w700));
  }
}
