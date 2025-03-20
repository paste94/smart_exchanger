import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_exchanger/features/home_screen/provider/value.dart';
import 'package:smart_exchanger/features/home_screen/widgets/conversion.dart';
import 'package:smart_exchanger/features/home_screen/widgets/from_button.dart';
import 'package:smart_exchanger/features/home_screen/widgets/swap_currencies.dart';
import 'package:smart_exchanger/features/home_screen/widgets/to_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: const [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: FromButton(),
                ),
              ),
              SwapCurrencies(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: ToButton(),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Conversion(),
        ],
      ),
    );
  }
}
