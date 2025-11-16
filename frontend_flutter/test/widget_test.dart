import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend_flutter/src/screens/home_screen.dart';
import 'package:frontend_flutter/src/providers/app_providers.dart';
import 'package:frontend_flutter/src/services/api_service.dart';


// A fake API service for testing (instead of calling backend)
class FakeApiService extends ApiService {
  FakeApiService() : super(baseUrl: '');

  @override
  Future<List<dynamic>> getBills() async {
    return [
      {
        "id": 1,
        "category": "shopping",
        "amountDue": 500,
        "dueDate": "2025-12-10",
        "paid": false
      }
    ];
  }
}

void main() {
  testWidgets('HomeScreen loads and shows a bill', (WidgetTester tester) async {
    // Override apiProvider with FakeApiService
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          apiProvider.overrideWithValue(FakeApiService()),
        ],
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    // Let FutureProvider complete
    await tester.pumpAndSettle();

    // Check if the bill card is shown
    expect(find.text("shopping • ₹500"), findsOneWidget);
    expect(find.text("Due Date: 2025-12-10"), findsOneWidget);
  });
}
