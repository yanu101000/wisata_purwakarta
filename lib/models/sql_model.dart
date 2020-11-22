import 'dart:convert';
import 'package:http/http.dart' as http;

class UserResult {
  int value;
  String pesan;
  String emailAPI;
  String usernameAPI;
  int idUser;

  UserResult(
      {this.value, this.emailAPI, this.idUser, this.pesan, this.usernameAPI});

  factory UserResult.createPostsResult(Map<String, dynamic> data) {
    return UserResult(
      value: data['value'],
      pesan: data['message'],
      emailAPI: data['email'],
      usernameAPI: data['username'],
    );
  }

  static Future<UserResult> sqlUserConnect(
      {String email, String username, String password, String url}) async {
    var response;
    if(username == null) {
      response = await http.post(url, body: {
        'email': email,
        'password': password,
      });
      return UserResult.createPostsResult(jsonDecode(response.body));
    }
    response = await http.post(url, body: {
      'email': email,
      'password': password,
      'username': username,
    });
    return UserResult.createPostsResult(jsonDecode(response.body));
  }
}
