import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather/data/model/weather_model/weather_model.dart';
import 'package:weather/widget/glass_box.dart';
import 'package:weather/widget/temp_text.dart';

class NextDayCard extends StatelessWidget {
  final WeatherModel data;
  final int index;
  const NextDayCard({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final d1 = data.forecast!.forecastday![index].hour![1].condition!;
    final d2 = data.forecast!.forecastday![index].day!;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GlassBox(
        hight: 220,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Date",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      DateFormat("E, d MMM").format(DateTime.parse(
                          data.forecast!.forecastday![index].date!)),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TempText(tempType: "Max", temperature: d2.maxtempC!),
                        TempText(tempType: "Min", temperature: d2.mintempC!),
                        Text(
                          d1.text!,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 90,
                      child: Image.network(
                        "https:${d1.icon}",
                        fit: BoxFit.fill,
                        // "https://cdn.weatherapi.com/weather/64x64/night/113.png",
                      ),
                    ),
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
