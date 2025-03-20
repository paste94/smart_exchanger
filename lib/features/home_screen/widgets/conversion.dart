import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_currency_rate/live_currency_rate.dart';
import 'package:smart_exchanger/features/home_screen/provider/conversion_rate.dart';
import 'package:smart_exchanger/features/home_screen/provider/value.dart';

class Conversion extends ConsumerWidget {
  const Conversion({super.key});

  Future<CurrencyRate> conversion(String fromCode, String toCode) =>
      LiveCurrencyRate.convertCurrency(fromCode, toCode, 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversionRate = ref.watch(conversionRateProvider);
    final fromSymbol = ref.watch(fromValueProvider).value?.symbol;
    final toSymbol = ref.watch(toValueProvider).value?.symbol;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: conversionRate.when(
        // Text('Conversion: ${rate?.result}')
        data:
            (rate) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$fromSymbol 1',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$toSymbol ${rate?.result.toStringAsFixed(4)}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),

        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Text('Error: $error'),
      ),
    );
  }
}
