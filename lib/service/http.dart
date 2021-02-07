import 'dart:convert';
import 'package:http/http.dart' as http;

const PROTOCOL = "https";
const DOMAIN = "servo-bus-backend.herokuapp.com";

Future httpPost(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route";
  var result = await http
      .post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return jsonDecode(result.body);
}

Future httpGet(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var result =
      await http.get(url, headers: {"Content-Type": "application/json"});
  return jsonDecode(result.body);
}
