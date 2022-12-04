import 'dart:convert';
import 'package:http/http.dart' as http;

class Utils {
  const Utils({
    this.url =
        '', // inizializzo il parametro url nel costrutto con valore default
  });

  final String url;

  Future<Utils> updateUrl() async {
    //creo un nuovo oggetto utils con il parametro url aggiornato
    http.Response response = await http.get(
      Uri.parse("http://isitidiandrea.altervista.org/tapparelle"),
    );

    return Utils(url: response.body);
  }

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
    //qui da errore perchè la stringa url è ancora vuota
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
