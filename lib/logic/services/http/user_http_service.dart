import 'dart:convert';

import 'package:http/http.dart' as http;

class UserHttpService {
  Future<void> getUsers({required String email}) async {
    final Uri url = Uri.parse(
        'https://summarize-it-8ae05-default-rtdb.firebaseio.com/users/$email.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('error');
    }
  }

  Future<void> addUser() async {
    final Uri url = Uri.parse(
        'https://summarize-it-8ae05-default-rtdb.firebaseio.com/users/.json');

    Map<String, dynamic> data = {};
    data['test@gmail.com'] = {};
    final response = await http.post(
      url,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('error');
    }
  }
}

void main() async {
  await UserHttpService().getUsers(email: 'test@gmail.com');
}
