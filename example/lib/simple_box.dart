import 'package:flutter/material.dart';

class SimpleBox extends StatelessWidget {
  const SimpleBox({
    Key key,
    this.color = Colors.blue,
    this.text = 'BOX',
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    Color textColor =
        color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: FittedBox(
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
