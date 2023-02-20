import 'package:dynamic_badges/dynamic_badges.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BadgeApp());
}

class BadgeApp extends StatelessWidget {
  const BadgeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BadgeExample(),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DynamicBadge(
              label: "3",
              childSize: 92,
              child: IconButton(
                iconSize: 92,
                icon: const Icon(
                  Icons.chat_bubble_outline_rounded,
                ),
                onPressed: () {},
              ),
            ),
            DynamicBadge.small(
              childSize: 92,
              child: IconButton(
                iconSize: 92,
                icon: const Icon(
                  Icons.chat_bubble_outline_rounded,
                ),
                onPressed: () {},
              ),
            ),
            DynamicBadge.counter(
              count: 1323,
              childSize: 92,
              child: IconButton(
                iconSize: 92,
                icon: const Icon(
                  Icons.chat_bubble_outline_rounded,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
