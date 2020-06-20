import 'package:flutter/material.dart';
import 'constens.dart';

class Iconcontent extends StatelessWidget {
  Iconcontent({@required this.iconName, @required this.gender});
  final IconData iconName;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
           size: 80.0,
          //  color: Color(0xFF8E8E99),
           ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: klableTextStyle,
        )
      ],
    );
  }
}
