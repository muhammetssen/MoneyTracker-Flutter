import 'dart:convert';

import 'package:MoneyTracker/globals.dart';
import 'package:http/http.dart';

class HttpService {
  Future postRequest(String endPoint, {Map<String, String> body}) async {
    Response res = await post(globals.URL + endPoint,
        headers: {'content-type': 'application/json'}, body: jsonEncode(body));
    var resBody = json.decode(res.body);
    return resBody;
  }
}
