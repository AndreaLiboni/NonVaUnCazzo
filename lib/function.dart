import 'dart:convert';
import 'package:http/http.dart' as http;

class Utils {
  final String url =
      "https://advertising-catalyst-fur-dramatically.trycloudflare.com";

  Future<http.Response> up(String name) {
    return http.post(
      Uri.parse(url + "/up/" + name),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'key': "ciao",
      }),
    );
  }

  Future<http.Response> down(String name) {
    return http.post(
      Uri.parse(url + "/down/" + name),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'key': "ciao",
      }),
    );
  }

  Future<String> status(String name) async {
    final requ = await http.post(
      Uri.parse(url + "/status/" + name),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'key': "ciao",
      }),
    );
    if (requ.statusCode == 200) {
      return jsonDecode(requ.body)["status"];
    } else {
      throw Exception('Network error');
    }
  }
}
