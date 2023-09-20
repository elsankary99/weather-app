import 'package:flutter/material.dart';

class TempText extends StatelessWidget {
  final String tempType;
  final num temperature;
  const TempText({
    super.key,
    required this.tempType,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$tempType :  ",
          style: const TextStyle(color: Colors.amber, fontSize: 16),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (temperature).toInt().toString(),
              style: const TextStyle(color: Colors.white, fontSize: 19),
            ),
            const Text(
              " °C",
              style: TextStyle(color: Colors.amber, fontSize: 14),
            )
          ],
        ),
      ],
    );
  }
}
