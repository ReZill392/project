import 'package:flutter/foundation.dart';
import 'package:project/database/transaction_db.dart';
import 'package:project/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    
  ];

  List<Transactions> getTransaction() {
    return transactions;
  }

  Future<void> addTransaction(Transactions transaction) async {
    var db = await TransactionDB(dbName: 'transactions.db');
    var keyID = await db.insertDatabase(transaction);
    this.transactions = await db.loadAllData();
    notifyListeners();
  }

  void deleteTransaction(int index) {
    transactions.removeAt(index);
    notifyListeners(); 
  }
}
