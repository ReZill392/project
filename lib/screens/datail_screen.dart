import 'package:flutter/material.dart';
import 'package:project/models/transactions.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transactions transaction;

  const TransactionDetailPage({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${transaction.title}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Type: ${transaction.type}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Genres: ${transaction.genres}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Theme: ${transaction.theme}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Score: ${transaction.score}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Date: ${transaction.date.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}