import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlong;

import '../cubit/trainer_list_cubit.dart';
import '../cubit/trainer_list_state.dart';

class TrainerMapScreen extends StatelessWidget {
  const TrainerMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerListCubit, TrainerListState>(
      builder: (context, state) {
        if (state is! TrainerListLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final trainers = state.trainers;
        final markers = <Marker>[];

        // If no lat/lng on the trainer, skip map marker.
        // In a production app, trainer list items would include coordinates.
        // For now we show a centered map without pins.
        for (final _ in trainers) {
          // Map markers will be added when coordinates are available.
        }

        return FlutterMap(
          options: const MapOptions(
            initialCenter: latlong.LatLng(52.2297, 21.0122), // Warsaw
            initialZoom: 11.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'fit.ziro.app',
            ),
            MarkerLayer(markers: markers),
          ],
        );
      },
    );
  }
}
