import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rest_api_calls/base_request.dart';
import 'package:rest_api_calls/Item.dart';

class RequestItem implements HTTPReqsuest<Item> {
  final String url;
  const RequestItem({@required this.url});

  Future<Item> execute() async {
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw http.ClientException("Oh darn!");
    }

    return _parseJson(response.body);
  }

  Item _parseJson(String response) => Item.fromJson(jsonDecode(response));
}
