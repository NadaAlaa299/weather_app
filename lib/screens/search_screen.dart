import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Search a City',
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getweathercubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter city name',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
            ),
          ),
        ),
      ),
    );
  }
}
