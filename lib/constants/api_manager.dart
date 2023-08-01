import 'dart:convert';

import 'package:http/http.dart';

class ApiManager {
  static Future<Response> getRequest(var url, {dynamic}) async {
    return await get(
      Uri.parse(url),
    
    );
  }}