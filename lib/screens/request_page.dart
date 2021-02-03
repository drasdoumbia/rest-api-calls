import 'package:flutter/material.dart';
import 'package:rest_api_calls/api/base_request.dart';

import '../models/Item.dart';
import '../widgets/error_widget.dart';
import '../widgets/success_widget.dart';

class HTTPWidget extends StatefulWidget {
  final HTTPReqsuest<Item> _request;
  const HTTPWidget(this._request);

  @override
  _HTTPWidgetState createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  Future<Item> futureItems;

  @override
  void initState() {
    super.initState();

    futureItems = widget._request.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Item>(
      future: futureItems,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorItemWidget();
        }
        if (snapshot.hasData) {
          return SuccessItemWidget(snapshot.data);
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
