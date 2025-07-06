import 'space.dart';

class Booking {
  final Space space;
  final DateTime start;
  final DateTime end;
  final int participants;
  final String activity;
  final List<String> equipment;
  final List<String> invitees;

  Booking({
    required this.space,
    required this.start,
    required this.end,
    required this.participants,
    required this.activity,
    required this.equipment,
    required this.invitees,
  });
}
