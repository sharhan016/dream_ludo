import 'package:dream_ludo/widgets/board_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BoardWidget displays quadrants correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: BoardWidget()));

    expect(find.byType(Quadrant), findsNWidgets(4));
    expect(find.byWidgetPredicate((widget) => widget is Quadrant && widget.color == Colors.blue), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is Quadrant && widget.color == Colors.red), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is Quadrant && widget.color == Colors.yellow), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is Quadrant && widget.color == Colors.green), findsOneWidget);
  });

  testWidgets('BoardWidget displays home areas correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: BoardWidget()));

    expect(find.byType(Container), findsWidgets);
    expect(find.byWidgetPredicate((widget) => widget is Container && widget.decoration != null), findsWidgets);
    expect(find.byWidgetPredicate((widget) => widget is Container && (widget.decoration as BoxDecoration).shape == BoxShape.circle), findsNWidgets(4));
  });

  testWidgets('BoardWidget displays triangles correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: BoardWidget()));

    expect(find.byType(CustomPaint), findsNWidgets(4));
    expect(find.byWidgetPredicate((widget) => widget is CustomPaint && (widget.painter as TrianglePainter).color == Colors.blue), findsOneWidget);
        expect(find.byWidgetPredicate((widget) => widget is CustomPaint && (widget.painter as TrianglePainter).color == Colors.red), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is CustomPaint && (widget.painter as TrianglePainter).color == Colors.yellow), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is CustomPaint && (widget.painter as TrianglePainter).color == Colors.green), findsOneWidget);
  });
}