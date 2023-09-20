import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "The next two days in ",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          "$text .",
          style: const TextStyle(color: Colors.amber, fontSize: 16),
        ),
      ],
    );
  }
}
