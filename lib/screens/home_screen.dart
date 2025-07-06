import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/booking_provider.dart';
import '../models/sample_data.dart';
import 'booking_form_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Espacios Disponibles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HistoryScreen()),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: spaces.length,
        itemBuilder: (context, index) {
          final space = spaces[index];
          return ListTile(
            title: Text(space.name),
            subtitle: Text('Capacidad: ${space.capacity} personas'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookingFormScreen(space: space),
              ),
            ),
          );
        },
      ),
    );
  }
}
