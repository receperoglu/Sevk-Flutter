import 'dart:convert';
import 'package:http/http.dart';

import '../const/baseUrl.dart';

class HttpService {
  getApi(dynamic request) async {
    print(Uri.parse(BaseUrl().base + request));
    Response res = await get(Uri.parse(BaseUrl().base + request));
    List<dynamic> body = jsonDecode(res.body);
    return body;
  }
}
