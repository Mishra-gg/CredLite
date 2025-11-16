import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  String? jwt; // token stored in memory for demo

  ApiService({required this.baseUrl});

  // LOGIN
  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      jwt = response.body;
      return jwt;
    }
    return null;
  }

  // GET BILLS
  Future<List<dynamic>> getBills() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/bills'),
      headers: {"Authorization": "Bearer $jwt"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }

  // PAY BILL
  Future<bool> payBill(int id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/bills/$id/pay'),
      headers: {"Authorization": "Bearer $jwt"},
    );

    return response.statusCode == 200;
  }
}
