import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_exchanger/features/home_screen/functions/handlers.dart';
import 'package:smart_exchanger/features/home_screen/provider/value.dart';

class ToButton extends ConsumerWidget {
  const ToButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toValue = ref.watch(toValueProvider);

    return ElevatedButton(
      onPressed:
          () => showCurrencyPicker(
            context: context,
            showFlag: true,
            showCurrencyName: true,
            showCurrencyCode: true,
            onSelect: (Currency currency) {
              ref.read(toValueProvider.notifier).setValue(currency);
            },
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            toValue.when(
              data: flagData,
              error: flagError,
              loading: flagLoading,
            ),
          ),
          const Expanded(child: SizedBox()),
          // const SizedBox(width: 8),
          toValue.when(
            data: codeDataOrTo,
            error: codeError,
            loading: codeLoading,
          ),
          const Expanded(child: SizedBox()), // Espansione a destra
          const Icon(Icons.arrow_drop_down), // Icona fissa a destra
        ],
      ),
    );
  }
}
