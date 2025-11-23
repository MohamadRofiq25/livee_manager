import '../models/transaction_model.dart';

abstract class TransactionRemoteDataSource {
  Future<List<TransactionModel>> fetchTransactions();
  Future<void> addTransaction(TransactionModel transaction);
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  @override
  Future<List<TransactionModel>> fetchTransactions() async {
    await Future.delayed(const Duration(seconds: 1)); // simulasi loading

    return [
      TransactionModel(
        id: '1',
        title: 'Ujungmanik Berholawat',
        amount: 1500000,
        date: DateTime(2024, 12, 10),
      ),
      TransactionModel(
        id: '2',
        title: 'Wedding Rina & Roni',
        amount: 2000000,
        date: DateTime(2025, 1, 3),
      ),
      TransactionModel(
        id: '3',
        title: 'Pengajian Akbar Bersama Gus Iqdam',
        amount: 3000000,
        date: DateTime(2025, 1, 8),
      ),
    ];
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
