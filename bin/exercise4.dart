import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchUsers() async {
  final url = Uri.parse(
      'https://random-data-api.com/api/v3/projects/265f8441-dbb3-419c-a375-9dc4e4cb1c1e?api_key=iAlJDBHolm8DzSlYeeaGoQ');
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = json.decode(response.body);

      final List<Map<String, dynamic>> users =
          List<Map<String, dynamic>>.from(decodedJson['data']);

      for (var user in users) {
        final uuid = user['uuid'];
        final firstName = user['first_name'];
        final lastName = user['last_name'];
        print("$firstName $lastName's uuid: $uuid");
      }
    } else {
      print('Failed to load users. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() {
  fetchUsers();
}
