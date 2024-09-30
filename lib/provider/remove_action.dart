import 'package:flutter/material.dart';
import 'package:project/provider/transaction_provider.dart';
import 'package:provider/provider.dart';

void removeTransaction(BuildContext context, int index) {
  var provider = Provider.of<TransactionProvider>(context, listen: false);
  provider.deleteTransaction(index);
}