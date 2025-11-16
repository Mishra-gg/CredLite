import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../widgets/bill_card.dart';
import 'pay_screen.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billsAsync = ref.watch(billsProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Your Bills")),
      body: billsAsync.when(
        data: (bills) {
          if (bills.isEmpty) {
            return Center(child: Text("No bills found"));
          }

          return ListView.builder(
            itemCount: bills.length,
            itemBuilder: (_, i) {
              final bill = bills[i];
              return BillCard(
                bill: bill,
                onPay: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PayScreen(bill: bill),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Text("Something went wrong"),
        ),
      ),
    );
  }
}
