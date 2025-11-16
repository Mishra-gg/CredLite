import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

final apiProvider = Provider<ApiService>((ref) {
  return ApiService(baseUrl: 'http://10.0.2.2:8080');
});

// Auto-load bills
final billsProvider = FutureProvider((ref) async {
  final api = ref.watch(apiProvider);
  return api.getBills();
});
