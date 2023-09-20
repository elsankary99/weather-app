import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/provider/weather_provider.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.withOpacity(0.25)),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          onSubmitted: (value) {
            ref.read(cityProvider.notifier).state = value;
          },
          cursorColor: Colors.white,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              prefixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.white.withOpacity(0.85),
                size: 20,
              )),
        ));
  }
}
