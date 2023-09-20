import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/extension/media_query.dart';
import 'package:weather/data/model/weather_model/weather_model.dart';
import 'package:weather/widget/glass_box.dart';

class CurrentDayCard extends StatelessWidget {
  final WeatherModel data;
  const CurrentDayCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassBox(
        hight: context.height * 0.3,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      DateFormat("d MMM. yyy").format(DateTime.now()),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data.current!.tempC!).toInt().toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            ),
                            const Text(
                              " °C",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 30),
                            )
                          ],
                        ),
                        Text(
                          data.current!.condition!.text!,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      child: Image.network(
                        "https:${data.current!.condition!.icon}",

                        fit: BoxFit.cover,
                        // "https://cdn.weatherapi.com/weather/64x64/night/113.png",
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationDot,
                      color: Colors.amber,
                    ),
                    Expanded(
                      child: Text(
                        " ${data.location!.name}, ${data.location!.region}, ${data.location!.country}.",
                        maxLines: 1,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
