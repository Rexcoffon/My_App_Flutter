import 'package:flutter/material.dart';

class HistoryDetailsScreen extends StatelessWidget {
  final String result;
  final String date;

  const HistoryDetailsScreen({@required this.result, @required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Details',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          )),
      body: Container(
        child: Center(
          child: Column(
            children: [Text(date), Text(result)],
          ),
        ),
      ),
    );
  }
}
