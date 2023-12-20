import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/weather/weather_bloc.dart';

class WeathePage extends StatefulWidget {
  const WeathePage({super.key});

  @override
  State<WeathePage> createState() => _WeathePageState();
}

class _WeathePageState extends State<WeathePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherInitial || state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Temperature in ${state.cityName}: ${state.temperature.toStringAsFixed(0)}°C',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Trigger weather fetching
                      BlocProvider.of<WeatherBloc>(context).add(FetchWeather(_controller.text),);
                    },
                    child: Text('Refresh'),
                  ),
                ],
              ),
            );
          } else {
            return Container(); // Handle other states if needed
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Enter City Name',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Trigger weather fetching
                BlocProvider.of<WeatherBloc>(context).add(FetchWeather(_controller.text),);
              },
            ),
          ),
        ),
      ),
    );
  }
}
