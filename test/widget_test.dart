import 'package:flutter_test/flutter_test.dart';

import 'package:aplikasi/main.dart';

void main() {
  testWidgets('CatatanKuApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CatatanKuApp());

    // Verify that the splash screen shows the title.
    expect(find.text('CatatanKu'), findsOneWidget);
  });
}
