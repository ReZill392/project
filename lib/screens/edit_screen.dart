import 'package:flutter/material.dart';
import 'package:project/models/transactions.dart';

void showEditDialog(BuildContext context, Transactions transaction, Function(Transactions) onUpdate) {
  final titleController = TextEditingController(text: transaction.title);
  final typeController = TextEditingController(text: transaction.type);
  final genresController = TextEditingController(text: transaction.genres);
  final themeController = TextEditingController(text: transaction.theme);
  final scoreController = TextEditingController(text: transaction.score.toString());
  final reviewController = TextEditingController(text: transaction.review);
  final _formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Edit Details"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: typeController,
                decoration: const InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: genresController,
                decoration: const InputDecoration(labelText: 'Genres'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a genre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: themeController,
                decoration: const InputDecoration(labelText: 'Theme'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a theme';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: scoreController,
                decoration: const InputDecoration(labelText: 'Score'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a score';
                  }
                  final score = double.tryParse(value);
                  if (score == null || score < 0 || score > 10) {
                    return 'Please enter a valid score (0-10)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: reviewController,
                decoration: const InputDecoration(labelText: 'Your Review'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your review';
                  }
                  return null;
                },
              ),
            ],
          ),
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
              if (_formKey.currentState!.validate()) {
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
            },
          ),
        ],
      );
    },
  );
}