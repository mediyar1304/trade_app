import 'package:flutter/material.dart';

Widget label(String text) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: const Color(0xFFE0ECF8),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Color(0xFF1F53E4), fontSize: 14),
    ),
  );
}
