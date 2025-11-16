import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';

class PayScreen extends ConsumerWidget {
  final Map bill;

  PayScreen({required this.bill});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(apiProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Pay Bill")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Confirm Payment",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            Text(
              "Category: ${bill['category']}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Amount: ₹${bill['amountDue']}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Due Date: ${bill['dueDate']}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 35),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () async {
                // call backend
                final success = await api.payBill(bill['id']);

                // go back
                Navigator.pop(context);

                // show result
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success
                        ? "Payment Successful"
                        : "Payment Failed"),
                  ),
                );

                // refresh bills on home screen
                ref.refresh(billsProvider);
              },
              child: Text("Pay Now"),
            )
          ],
        ),
      ),
    );
  }
}
