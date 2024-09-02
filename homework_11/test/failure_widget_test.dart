import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:homework_11/utils/failure_widget.dart';

void main() {
  group('FailureWidget', () {
    testWidgets('Widget test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FailureWidget(
            refresh: () {},
          ),
        ),
      );

      final textFinder = find.text('Загрузка не удалась, нажмите, чтобы повторить попытку');
      expect(textFinder, findsOneWidget);

      final refreshIndicatorFinder = find.byType(RefreshIndicator);
      expect(refreshIndicatorFinder, findsOneWidget);
    });

    testGoldens('Golden test', (tester) async {
      await loadAppFonts();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FailureWidget(
            refresh: () {},
          ),
        ),
      );

      await screenMatchesGolden(tester, 'failure_widget');
    });
  });
}
