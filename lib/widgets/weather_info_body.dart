import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherColor(weatherModel.weatherStatus),
            getWeatherColor(weatherModel.weatherStatus)[300]!,
            getWeatherColor(weatherModel.weatherStatus)[50]!,
            ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Image.network('https:${weatherModel.image}'),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 2,
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Mintemp ${weatherModel.minTemp.round()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weatherModel.weatherStatus,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
