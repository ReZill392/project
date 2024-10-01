import 'package:flutter/material.dart';
import 'package:project/models/transactions.dart';
import 'package:project/provider/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final formKey = GlobalKey<FormState>();
  
  final titleController = TextEditingController();
  final typeController = TextEditingController();
  final genresController = TextEditingController();
  final themeController = TextEditingController();
  final scoreController = TextEditingController();
  final reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แบบฟอร์มข้อมูล'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              autofocus: true,
              controller: titleController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Type',
              ),
              autofocus: true,
              controller: typeController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Genres',
              ),
              autofocus: true,
              controller: genresController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Theme',
              ),
              autofocus: true,
              controller: themeController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Your Score',
              ),
              keyboardType: TextInputType.number,
              controller: scoreController,
              validator: (String? input) {
                try {
                  double score = double.parse(input!);
                  if (score < 0) {
                    return 'กรุณากรอกข้อมูลมากกว่า 0';
                  }
                  if (score > 10) {
                    return 'กรุณากรอกข้อมูลไม่เกิน 10';
                  }
                } catch (e) {
                  return 'กรุณากรอกข้อมูลเป็นตัวเลข';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'your review',
              ),
              autofocus: true,
              controller: reviewController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            TextButton(
              child: const Text('บันทึก'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  var statement = Transactions(
                    keyID: null,
                    title: titleController.text,
                    type: typeController.text,
                    genres: genresController.text,
                    theme: themeController.text,
                    score: double.parse(scoreController.text),
                    date: DateTime.now(),
                    review: reviewController.text,
                  );

                  var provider = Provider.of<TransactionProvider>(context, listen: false);
                  provider.addTransaction(statement);

                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}