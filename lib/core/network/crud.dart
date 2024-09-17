import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


import 'package:dartz/dartz.dart';


import 'network_config.dart';
import 'status_request.dart';


class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String link, Map body, Map<String, String> headers) async {
    try {
      if (await NetworkConfig()) {
        var responce = await http.post(Uri.parse(link),
            body: jsonEncode(body), headers: headers);
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          Map reponce_body = jsonDecode(responce.body);
          print(reponce_body);
          return Right(reponce_body);
        } else {
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return Left(StatusRequest.serverFailure);
    }
  }


}
