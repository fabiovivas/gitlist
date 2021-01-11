import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:gitlist/data/protocols/http_client.dart';
import 'package:gitlist/data/protocols/http_error.dart';
import 'package:http/http.dart';

class HttpClientAdapter implements IHttpClient {
  final Client client;

  HttpClientAdapter(this.client);
  @override
  Future<dynamic> request(
      {@required String url, @required String method, Map body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
    var response = Response('', 500);

    try {
      if (method == 'get') response = await client.get(url, headers: headers);
      return _handleResponse(response);
    } catch (error) {
      throw error;
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isEmpty ? null : jsonDecode(response.body);
    } else if (response.statusCode == 403) {
      throw HttpError.forbiden;
    } else {
      throw HttpError.serverError;
    }
  }
}
