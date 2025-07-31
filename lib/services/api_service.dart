import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getPosts() async {
    final response = await http.get(
      Uri.parse('https://webhook.site/5a5fe8d4-0f05-414f-9407-808417c4739c'),
      headers: {
        "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/91.0.4472.124 Safari/537.36"
      },
    );

    print("Status Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load posts. Code: ${response.statusCode}");
    }
  }
}
