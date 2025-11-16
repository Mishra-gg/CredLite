import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  final Map bill;
  final VoidCallback onPay;

  BillCard({required this.bill, required this.onPay});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(
          "${bill['category']} • ₹${bill['amountDue']}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Due Date: ${bill['dueDate']}"),

        trailing: bill['paid'] == true
            ? Icon(Icons.check_circle, color: Colors.green, size: 28)
            : ElevatedButton(
                onPressed: onPay,
                child: Text("Pay"),
              ),
      ),
    );
  }
}
