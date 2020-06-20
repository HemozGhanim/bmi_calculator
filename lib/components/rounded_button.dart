import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RuoundedFloatButton extends StatelessWidget {
  final String tagName;
  final Function ontap;
  final IconData iconName;

  const RuoundedFloatButton({@required this.iconName ,@required this.tagName ,@required this.ontap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: tagName,
      child: Icon(iconName),
      foregroundColor: Colors.white54,
      backgroundColor: Color(0xFF4C4F5E),
      onPressed: ontap,

    );
  }
}
