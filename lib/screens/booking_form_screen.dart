import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/booking.dart';
import '../models/booking_provider.dart';
import '../models/space.dart';

class BookingFormScreen extends StatefulWidget {
  final Space space;

  const BookingFormScreen({super.key, required this.space});

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime _start = DateTime.now();
  DateTime _end = DateTime.now().add(const Duration(hours: 1));
  int _participants = 1;
  String _activity = '';
  final List<String> _equipment = [];
  final List<String> _invitees = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reservar ${widget.space.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Actividad'),
                onSaved: (v) => _activity = v ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Número de personas'),
                keyboardType: TextInputType.number,
                initialValue: '1',
                onSaved: (v) => _participants = int.tryParse(v ?? '1') ?? 1,
              ),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Confirmar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    _formKey.currentState?.save();
    final booking = Booking(
      space: widget.space,
      start: _start,
      end: _end,
      participants: _participants,
      activity: _activity,
      equipment: _equipment,
      invitees: _invitees,
    );
    Provider.of<BookingProvider>(context, listen: false).addBooking(booking);
    Navigator.pop(context);
  }
}
