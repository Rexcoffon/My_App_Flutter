import 'package:flutter/material.dart';

class TileHistory extends StatelessWidget {
  const TileHistory(
      {@required this.title, this.date = '', @required this.result});

  final String title;
  final String date;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Text(
            date,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
          Text(result,
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700))
        ],
      ),
      padding: EdgeInsets.only(bottom: 40),
    );
  }
}
