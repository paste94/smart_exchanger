import 'dart:async';

import 'package:live_currency_rate/live_currency_rate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_exchanger/features/home_screen/provider/value.dart';
import 'package:smart_exchanger/main.dart';

part 'conversion_rate.g.dart';

@riverpod
class ConversionRate extends _$ConversionRate {
  @override
  FutureOr<CurrencyRate?> build() {
    final fromCode = ref.watch(fromValueProvider).value?.code;
    final toCode = ref.watch(toValueProvider).value?.code;
    return _fetch(fromCode, toCode);
  }

  Future<CurrencyRate?> _fetch(String? fromCode, String? toCode) async {
    try {
      if (fromCode == null || toCode == null) {
        return null;
      }
      return await LiveCurrencyRate.convertCurrency(fromCode, toCode, 1);
    } catch (error) {
      logger.e('Error fetching currency rate: \n$error\nReturning null');
      return null;
    }
  }
}
