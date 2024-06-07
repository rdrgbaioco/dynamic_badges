import 'package:dynamic_badges/source/badges.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DynamicBadge(
              count: 1000,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.groups_2_outlined,
                ),
              ),
            ),
            const DynamicBadge(
              count: 1000,
              child: Icon(
                Icons.email,
                size: 48,
              ),
            ),
            const DynamicBadge.small(
              child: Icon(
                Icons.email,
                size: 48,
              ),
            ),
            const DynamicBadge.small(
              child: Icon(
                Icons.email,
                size: 98,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
