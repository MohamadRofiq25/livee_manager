import 'package:flutter/material.dart';
import 'package:livee_manager/features/transaksi/domain/usecases/get_all_transacion.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/usecases/create_transaction.dart';

class TransactionController extends ChangeNotifier {
  final GetAllTransactions getAllTransactions;
  final CreateTransaction createTransaction;

  List<TransactionEntity> transactions = [];
  bool isLoading = false;
  String? error;

  TransactionController( {
    required this.getAllTransactions,
    required this.createTransaction,
  });

  Future<void> loadTransactions() async {
    isLoading = true;
    notifyListeners();

    try {
      transactions = await getAllTransactions();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
