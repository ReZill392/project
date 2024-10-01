import 'package:flutter/material.dart';
import 'package:project/models/transactions.dart';

void showEditDialog(BuildContext context, Transactions transaction, Function(Transactions) onUpdate) {
  final titleController = TextEditingController(text: transaction.title);
  final typeController = TextEditingController(text: transaction.type);
  final genresController = TextEditingController(text: transaction.genres);
  final themeController = TextEditingController(text: transaction.theme);
  final scoreController = TextEditingController(text: transaction.score.toString());
  final reviewController = TextEditingController(text: transaction.review); 

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Edit Transaction"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(labelText: 'Type'),
            ),
            TextField(
              controller: genresController,
              decoration: const InputDecoration(labelText: 'Genres'),
            ),
            TextField(
              controller: themeController,
              decoration: const InputDecoration(labelText: 'Theme'),
            ),
            TextField(
              controller: scoreController,
              decoration: const InputDecoration(labelText: 'Score'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: reviewController,
              decoration: const InputDecoration(labelText: 'your review'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              var updatedTransaction = Transactions(
                title: titleController.text,
                type: typeController.text,
                genres: genresController.text,
                theme: themeController.text,
                score: double.tryParse(scoreController.text) ?? transaction.score,
                date: transaction.date,
                review: reviewController.text,
              );

              onUpdate(updatedTransaction);

              Navigator.pop(context);
            }
          ),
        ],
      );
    },
  );
}