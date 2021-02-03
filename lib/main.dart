import 'package:flutter/material.dart';
import 'package:rest_api_calls/item_request.dart';
import 'package:rest_api_calls/request_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static const _url = "https://jsonplaceholder.typicode.com/posts/10";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Request Demo"),
        ),
        body: HTTPWidget(
          RequestItem(url: _url),
        ),
      ),
    );
  }
}
