import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
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

String formatDisplayNameToEmail(String text) {
  final regex =
      RegExp('[^a-zA-Z0-9_]'); // Matches special characters except underscore
  final formattedText = text
      .toLowerCase() // Convert to lowercase first
      .replaceAll(regex, '')
      .replaceAll(' ', '_');
  return '$formattedText@wa.com';
}

String accessLevelToString(int accessLevel) {
  switch (accessLevel) {
    case 1:
      return 'Sales Person';
    case 2:
      return 'Sales Team Manager';
    case 3:
      return 'Sales Manager';
    case 4:
      return 'Admin';
    case 5:
      return 'Super Admin';
    default:
      return '';
  }
}

MaterialColor accessLevelToColor(int accessLevel) {
  switch (accessLevel) {
    case 1:
      return Colors.lightGreen;
    case 2:
      return Colors.teal;
    case 3:
      return Colors.orange;
    case 4:
      return Colors.lightBlue;
    case 5:
      return Colors.blue;
    default:
      return Colors.lightGreen;
  }
}

int stringToAccessLevel(String accessLevel) {
  switch (accessLevel) {
    case 'Sales Person':
      return 1;
    case 'Sales Team Manager':
      return 2;
    case 'Sales Manager':
      return 3;
    case 'Admin':
      return 4;
    case 'Super Admin':
      return 5;
    default:
      return 0;
  }
}

bool isValidNumber(String? input) {
  if (input == null || input.isEmpty) {
    return false;
  }
  // Use try-catch to handle potential errors when parsing
  try {
    double.parse(input); // Use double.parse for decimal numbers
    return true;
  } catch (e) {
    return false;
  }
}
