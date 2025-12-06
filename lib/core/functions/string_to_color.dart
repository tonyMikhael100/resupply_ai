import 'package:flutter/material.dart';

Color stringToColor(String hex) {
  String formattedHex = hex.replaceAll('#', '');
  if (formattedHex.length == 6)
    formattedHex = 'FF$formattedHex'; // full opacity
  return Color(int.parse(formattedHex, radix: 16));
}
