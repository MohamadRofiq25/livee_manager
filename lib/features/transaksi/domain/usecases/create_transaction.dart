
import 'package:livee_manager/features/transaksi/domain/repositories/transacion_repository.dart';
import '../entities/transaction_entity.dart';

class CreateTransaction {
  final TransactionRepository repository;

  CreateTransaction(this.repository);

  Future<void> call(TransactionEntity transaction) {
    return repository.createTransaction(transaction);
  }
}
