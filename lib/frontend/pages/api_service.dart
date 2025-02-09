import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String backendUrl =
      "http://10.0.2.2:5002/chat"; // Updated Backend URL for Android Emulator

  Future<String> sendMessage(String message) async {
    final uri = Uri.parse(backendUrl);
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'message': message}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['response'] ?? "No response from bot";
    } else {
      throw Exception("Failed to get response from backend");
    }
  }
}
