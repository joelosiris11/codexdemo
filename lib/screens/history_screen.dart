import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/booking_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<BookingProvider>(context).bookings;

    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Reservas')),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return ListTile(
            title: Text(booking.space.name),
            subtitle: Text('${booking.start} - ${booking.end}'),
          );
        },
      ),
    );
  }
}
