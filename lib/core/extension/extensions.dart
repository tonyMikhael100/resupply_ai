import 'package:flutter/material.dart';

extension HexColor on String {
  Color toColor() {
    String hex = this.replaceAll('#', '');

    // If 6 chars, add 'FF' for full opacity
    if (hex.length == 6) hex = 'FF$hex';

    return Color(int.parse(hex, radix: 16));
  }
}
