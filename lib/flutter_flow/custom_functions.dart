import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime stringToDate(String string) {
  // vou informar uma string com numeros e / e preciso converter para o formato data yyyy-mm-dd
  final List<String> parts = string.split('/');
  final int day = int.parse(parts[0]);
  final int month = int.parse(parts[1]);
  final int year = int.parse(parts[2]);
  final String formattedDate =
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  return DateTime.parse(formattedDate);
}

double currencyRealDouble(String input) {
  // remover todos os caracteres não numéricos e converter em double com decimal .
  if (input == null) return 0;
  final onlyDigits = input.replaceAll(RegExp(r'[^0-9]'), '');
  final value = double.parse(onlyDigits) / 100.0;
  return value;
}
