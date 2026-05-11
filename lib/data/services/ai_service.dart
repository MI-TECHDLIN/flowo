//TODO:make sure i switch the localhost to flowo-fastapi cli

import 'dart:convert';

import 'package:flowo/data/models/suggestiion_response.dart';
import 'package:flowo/data/models/task_model.dart';
import 'package:http/http.dart' as http;

class AiService {
  static const String _baseurl = '10.0.2.2:8000';

  Future<SuggestionResponse> getSuggestions(List<TaskModel> tasks) async {
    """
this function bascially helps get a two way request
- it sends to fastapi and get a future response backe through asychronous flow

""";

    // to fastapi
    var response = await http.post(
      Uri.http(_baseurl, '/suggestions'),
      headers: {'content-Type': 'application/json'},
      body: jsonEncode(tasks.map((t) => t.toJson()).toList()),
    );

    //response
    var data = jsonDecode(response.body);

    print(SuggestionResponse.fromJson(data));
    return SuggestionResponse.fromJson(data);
  }
}
