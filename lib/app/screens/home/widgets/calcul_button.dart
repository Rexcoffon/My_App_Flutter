import 'package:flutter/material.dart';

class CalculButton extends StatelessWidget {
  const CalculButton(
      {@required this.content,
      this.isDark = false,
      this.isBig = false,
      @required this.onTapFunction});

  final String content;
  final bool isDark;
  final bool isBig;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isBig ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              onTapFunction();
            },
            child: Ink(
              height: 50,
              width: 50,
              child: Center(
                  child: Container(
                      child: Text(content,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: isDark ? Colors.white : Colors.black)))),
              decoration: BoxDecoration(
                  color: isDark ? Colors.black : Colors.white,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
