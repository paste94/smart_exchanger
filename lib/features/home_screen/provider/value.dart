import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_exchanger/main.dart';

part 'value.g.dart';

@riverpod
class ToValue extends _$ToValue {
  @override
  FutureOr<Currency?> build() async {
    return await _fetch();
  }

  Future<Currency?> _fetch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? toString = prefs.getString('to');
      return toString == null
          ? null
          : Currency.from(json: json.decode(toString));
    } catch (error) {
      logger.w('Error fetching currency: \n$error\nReturning null');
      return null;
    }
  }

  Future<void> setValue(Currency? currency) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('to', json.encode(currency));
      return _fetch();
    });
  }
}

@riverpod
class FromValue extends _$FromValue {
  @override
  FutureOr<Currency?> build() async {
    return await _fetch();
  }

  Future<Currency?> _fetch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? toString = prefs.getString('from');
      return toString == null
          ? null
          : Currency.from(json: json.decode(toString));
    } catch (error) {
      logger.w('Error fetching currency: \n$error\nReturning null');
      return null;
    }
  }

  Future<void> setValue(Currency? currency) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('from', json.encode(currency));
      return _fetch();
    });
  }
}
