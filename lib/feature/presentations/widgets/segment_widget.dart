import 'package:flutter/material.dart';

Widget buildSegment(String text) {
  return Container(
    //color:  Color(0xFF78C4A4),
    padding: const EdgeInsets.only(right: 13, left: 13, top: 8, bottom: 8),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          const Color(0xFF4275FA).withOpacity(1),
          const Color(0xFF1102C6).withOpacity(0.87),
        ],
        begin: Alignment.topLeft, // Стартовая точка градиента
        end: Alignment.bottomRight, // Конечная точка градиента
      ),
    ),
    child: Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: 0,
        )),
  );
}
