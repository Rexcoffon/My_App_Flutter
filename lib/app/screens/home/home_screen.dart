import 'package:flutter/material.dart';
import 'package:my_app/app/screens/home/ui_Models/button_element_model.dart';
import 'package:my_app/app/screens/home/widgets/calcul_button.dart';
import 'package:my_app/app_routes.dart';
import 'package:function_tree/function_tree.dart';
import 'package:my_app/modules/history/data/repository/history_repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

navigateNamedToHistory(context) {
  Navigator.pushNamed(context, kHistoryRoute);
}

navigateToScanScreen(context) {
  Navigator.pushNamed(context, kScanRoute);
}

class _HomeScreenState extends State<HomeScreen> {
  HistoryRepository historyRepository = new HistoryRepository();

  final elements = [
    [
      ButtonElement(content: 'C'),
      ButtonElement(content: '('),
      ButtonElement(content: ')'),
      ButtonElement(content: '/')
    ],
    [
      ButtonElement(content: '7', isDark: true),
      ButtonElement(content: '8', isDark: true),
      ButtonElement(content: '9', isDark: true),
      ButtonElement(content: '*')
    ],
    [
      ButtonElement(content: '4', isDark: true),
      ButtonElement(content: '5', isDark: true),
      ButtonElement(content: '6', isDark: true),
      ButtonElement(content: '+')
    ],
    [
      ButtonElement(content: '1', isDark: true),
      ButtonElement(content: '2', isDark: true),
      ButtonElement(content: '3', isDark: true),
      ButtonElement(content: '-')
    ],
    [
      ButtonElement(content: '0', isDark: true, isBig: true),
      ButtonElement(content: '.'),
      ButtonElement(content: '=')
    ]
  ];

  String equation = '';
  List<String> equationOperator = [];
  List<String> equationElement = [];
  double result = 0;
  String current = '';
  String lastStoredResult = '0';

  onButtonTap(String element) {
    if (element == 'C') {
      remove();
    } else if (element == '=') {
      interpetEquation();
    } else {
      addToEquation(element);
      if (['*', '-', '+', '/'].contains(element)) {
        addOperatorToEquation(element);
      } else {
        addElementToEquation(element);
      }
    }
  }

  interpetEquation() {
    setState(() {
      result = equation.interpret();
    });
    saveToCache();
  }

  addToEquation(String element) {
    setState(() {
      equation += element;
    });
  }

  remove() {
    setState(() {
      equation = '';
      equationOperator = [];
      equationElement = [];
      result = 0;
    });
  }

  addOperatorToEquation(String op) {
    equationOperator.add(op);
  }

  addElementToEquation(String el) {
    equationElement.add(el);
  }

  saveToCache() async {
    historyRepository.saveResult(result);
    setState(() {
      lastStoredResult = result.toString();
    });
  }

  retrieveFromCache() async {
    lastStoredResult = await historyRepository.retrieve() ?? '0';
    setState(() {});
  }

  @override
  void initState() {
    retrieveFromCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.black,
              ),
              onPressed: () => navigateNamedToHistory(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                icon: Icon(Icons.camera),
                color: Colors.red,
                onPressed: () => navigateToScanScreen(context)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    'Dernier résultat calculé: ${lastStoredResult.toString()}'),
                Text(
                  equation,
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text(
                  result.toString(),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                  children: elements
                      .map((elementList) => Row(
                          children: elementList
                              .map((e) => CalculButton(
                                    content: e.content,
                                    isDark: e.isDark,
                                    isBig: e.isBig,
                                    onTapFunction: () => onButtonTap(e.content),
                                  ))
                              .toList()))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
