import 'dart:convert';
import 'package:http/http.dart';

import '../const/baseUrl.dart';

class HttpService {
  getApi(dynamic request) async {
    Response res = await get(Uri.parse(BaseUrl().base + request));
    List<dynamic> body = jsonDecode(res.body);
    return body;
  }
}
