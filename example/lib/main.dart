import 'package:dynamic_badges/dynamic_badges.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BadgeApp());
}


class BadgeApp extends StatelessWidget {
  const BadgeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const BadgeExample(),
    );
  }
}

class BadgeExample extends StatelessWidget {
  const BadgeExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Badge Example'),
            SizedBox(height: 20),
            DynamicBadge(
              label: "10+",
              icon: Icons.alarm_add,
              size: 48,
            ),
          ],
        )
      ),
    );
  }
}
