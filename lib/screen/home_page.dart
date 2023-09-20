import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/constant/app_image.dart';
import 'package:weather/core/extension/media_query.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/widget/current_day_card.dart';
import 'package:weather/widget/custom_text.dart';
import 'package:weather/widget/custom_text_field.dart';
import 'package:weather/widget/next_day_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.backGroundImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: context.height * 0.05),
                const CustomTextField(),
                ref.watch(cityProvider).isNotEmpty
                    ? ref.watch(weatherProvider).when(
                          data: (data) => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CurrentDayCard(data: data),
                                SizedBox(height: context.height * 0.1),
                                Column(
                                  children: [
                                    CustomText(text: data.location!.name!),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: context.height * 0.3,
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            data.forecast!.forecastday!.length -
                                                1,
                                        itemBuilder: (context, index) =>
                                            NextDayCard(
                                                data: data, index: 1 + index),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                          error: (error, stackTrace) => Center(
                              child: Text(
                            error.toString(),
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20),
                          )),
                          loading: () => const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                    : SizedBox(
                        height: context.height,
                        child: const Center(
                            child: Text(
                          "Start Search for city",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
