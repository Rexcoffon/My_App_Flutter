import 'package:flutter/material.dart';
import 'package:my_app/app/screens/history/widgets/tile_history.dart';
import 'package:my_app/app_routes.dart';
import 'package:my_app/modules/history/model/history_model.dart';

class HistoryScreen extends StatelessWidget {
  final tileElements = [
    HistoryModel(title: 'Toto', date: DateTime.now(), result: 299),
    HistoryModel(title: 'Toto', date: DateTime.now(), result: 299),
  ];

  void navigateNamedToHome(context) {
    Navigator.pushNamed(context, kHomeRoute);
  }

  void navigateToDetailsScreen(context, String result, String date) {
    Navigator.pushNamed(context, kHistoryDetailsRoute,
        arguments: [result, date]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Calcul récents',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        //elevation : effet ombre
        elevation: 0,
        //boutons d'action à droite de l'AppBar
        actions: [
          IconButton(
              icon: Icon(
                Icons.format_list_numbered,
                color: Colors.black,
              ),
              onPressed: () => navigateNamedToHome(context))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(40.0),
        children: tileElements
            .map((e) => InkWell(
                  onTap: () => navigateToDetailsScreen(
                      context, e.result.toString(), e.date.toString()),
                  child: TileHistory(
                    title: e.title,
                    date: e.date.toString(),
                    result: e.result.toString(),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
