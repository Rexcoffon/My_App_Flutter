import 'package:flutter/material.dart';

class HistoryModel {
  HistoryModel(
      {@required this.title,
      @required this.date,
      @required this.result,
      this.id});

  final String title;
  final DateTime date;
  final double result;
  final int id;
}
