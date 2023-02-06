import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_badges/dynamic_badges.dart';

void main() {
  testWidgets('Badge Example', (WidgetTester tester) async {
    await tester.pumpWidget(const BadgeApp());

    final columnFinder = find.byType(Column);
    expect(columnFinder, findsOneWidget);

    final textFinder = find.text('Badge Example');
    expect(textFinder, findsOneWidget);

    final dynamicBadgeTestFinder = find.byType(DynamicBadge);
    expect(dynamicBadgeTestFinder, findsNWidgets(2));
  });
}
