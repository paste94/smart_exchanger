import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_exchanger/features/home_screen/functions/handlers.dart';
import 'package:smart_exchanger/features/home_screen/provider/value.dart';

class FromButton extends ConsumerWidget {
  const FromButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromValue = ref.watch(fromValueProvider);

    return ElevatedButton(
      onPressed:
          () => showCurrencyPicker(
            context: context,
            showFlag: true,
            showCurrencyName: true,
            showCurrencyCode: true,
            onSelect: (Currency currency) {
              ref.read(fromValueProvider.notifier).setValue(currency);
            },
          ),
      child: Row(
        children: [
          Text(
            fromValue.when(
              data: flagData,
              error: flagError,
              loading: flagLoading,
            ),
          ),
          const Expanded(child: SizedBox()),
          fromValue.when(
            data: codeDataOrFrom,
            error: codeError,
            loading: codeLoading,
          ),
          const Expanded(child: SizedBox()),
          const Icon(Icons.arrow_drop_down), // Icona fissa a destra
        ],
      ),
    );
  }
}
