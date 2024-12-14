import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                      primarySwatch:
                          Colors.blue, // this defines general color styling

                      // Set up appBarTheme to change AppBar color specifically
                      appBarTheme: AppBarTheme(
                        color: getWeatherColor(
                                BlocProvider.of<GetWeatherCubit>(context)
                                    .weatherModel
                                    ?.weatherStatus,
                              ),
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: const HomeScreen(),
                  );
                },
              )),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.amber;
    case "partly cloudy":
      return Colors.lightBlue;
    case "cloudy":
      return Colors.grey;
    case "overcast":
      return Colors.blueGrey;
    case "mist":
      return Colors.lightBlue;
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "thundery outbreaks possible":
      return Colors.blue;
    case "blowing snow":
    case "blizzard":
      return Colors.blueGrey;
    case "fog":
    case "freezing fog":
      return Colors.blueGrey;
    case "patchy light drizzle":
    case "light drizzle":
      return Colors.lightBlue;
    case "freezing drizzle":
    case "heavy freezing drizzle":
      return Colors.lightBlue;
    case "patchy light rain":
    case "light rain":
      return Colors.blue;
    case "moderate rain":
    case "heavy rain":
      return Colors.blue;
    default:
      return Colors.blue;
  }
}
