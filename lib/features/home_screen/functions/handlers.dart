import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

String flagData(Currency? value) =>
    value != null ? CurrencyUtils.currencyToEmoji(value) : '';
String flagError(error, stackTrace) => '❌';
String flagLoading() => '⏳';

Widget codeDataOrTo(Currency? value) =>
    Text(value == null ? 'TO' : '${value.code} (${value.symbol})');
Widget codeDataOrFrom(Currency? value) =>
    Text(value == null ? 'FROM' : '${value.code} (${value.symbol})');
Widget codeError(error, stackTrace) => Text('???');
Widget codeLoading() => CircularProgressIndicator();
