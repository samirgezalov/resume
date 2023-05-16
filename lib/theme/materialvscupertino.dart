import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  final String text;
  // final TextStyle? style;
  final TextStyle style;
  final double textScaleFactor;
  const AdaptiveText(this.text, {Key key, this.style, this.textScaleFactor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return SelectableText(
        text,
        style: style,
        textScaleFactor: textScaleFactor,
      );
    return Text(text, style: style, textScaleFactor: textScaleFactor);
  }
}
