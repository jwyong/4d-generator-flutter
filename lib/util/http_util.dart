import 'package:http/http.dart';

extension HttpResponseUtil on Response {
  bool isSuccess() => statusCode == 200;
}