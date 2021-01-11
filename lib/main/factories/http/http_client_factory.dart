import 'package:gitlist/data/protocols/http_client.dart';
import 'package:gitlist/infra/http_client/http_client_adapter.dart';
import 'package:http/http.dart';

IHttpClient makeHttpAdapter() {
  final client = Client();
  final httpAdapter = HttpClientAdapter(client);
  return httpAdapter;
}
