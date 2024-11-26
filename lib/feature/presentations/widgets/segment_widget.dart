import 'package:flutter/material.dart';

Widget buildSegment(String text, Color color) {
  return Container(
    //color:  Color(0xFF78C4A4),
    padding: const EdgeInsets.only(right: 25, left: 25, top: 18, bottom: 18),
    //
    child: Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0,
        )),
  );
}
