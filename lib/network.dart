import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Network {
  Network(
      {required this.domain, this.unencodedPath = '', this.queryparameters});
  late final String domain;
  String unencodedPath = '';
  late final Map<String, dynamic>? queryparameters;
  Future<dynamic> getRequest() async {
    var url = Uri.https(domain, unencodedPath, queryparameters);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // as Map<String, dynamic>
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
