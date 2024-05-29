import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;

  return text[0].toUpperCase() + text.substring(1);
}

String formatCurrency(double value) {
  final currencyFormat = NumberFormat.currency(
    locale: 'en_US', // Use the appropriate locale
    symbol: r'$', // Specify the currency symbol
    decimalDigits: 2, // Number of decimal digits
  );

  return currencyFormat.format(value);
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    final regExp = RegExp(r'^[0-9]+([0-9]?)?$');
    if (regExp.hasMatch(newText)) {
      return newValue;
    }
    return oldValue;
  }
}

class DoubleInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    final regExp = RegExp(r'^[0-9]+([.][0-9]{2,})?$');
    if (regExp.hasMatch(newText)) {
      return newValue;
    }
    return oldValue;
  }
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
