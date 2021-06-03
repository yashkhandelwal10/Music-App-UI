//import 'dart:html';

//import 'dart:html';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vikrant_app/model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse("https://reqres.in/api/login");

    final http.Response response = await http.post(
      url,
      body: requestModel.toJson(),
    );
    //     await http.get(
    //   url,
    // );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
