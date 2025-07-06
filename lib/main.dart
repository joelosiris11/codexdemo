import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/booking_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingProvider(),
      child: MaterialApp(
        title: 'Teco Group Booking',
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          '/': (_) => const LoginScreen(),
          '/home': (_) => const HomeScreen(),
        },
      ),
    );
  }
}
