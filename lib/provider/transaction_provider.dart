import 'package:flutter/foundation.dart';
import 'package:project/database/transaction_db.dart';
import 'package:project/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    
  ];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }

  Future<void> addTransaction(Transactions transaction) async {
    var db = await TransactionDB(dbName: 'transactions.db');
    var keyID = await db.insertDatabase(transaction);
    this.transactions = await db.loadAllData();
    notifyListeners();
  }

  Future<void> deleteTransaction(int index) async {
    var db = await TransactionDB(dbName: 'transactions.db');
    await db.deleteTransaction(index);
    transactions = await db.loadAllData(); 
    notifyListeners();
  }

  Future<void> updateTransaction(int index, Transactions updatedTransaction) async {
    if (index >= 0 && index < transactions.length) {
      var db = TransactionDB(dbName: 'transactions.db');
      transactions[index] = updatedTransaction;
      await db.updatedTransaction(updatedTransaction);
      notifyListeners();
    }
  }
}