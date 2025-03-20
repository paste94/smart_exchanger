import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_exchanger/features/home_screen/provider/value.dart';

class SwapCurrencies extends ConsumerWidget {
  const SwapCurrencies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final from = ref.read(fromValueProvider).value;
        ref
            .read(fromValueProvider.notifier)
            .setValue(ref.read(toValueProvider).value);
        ref.read(toValueProvider.notifier).setValue(from);
      },
      icon: Icon(Icons.swap_horiz),
    );
  }
}
