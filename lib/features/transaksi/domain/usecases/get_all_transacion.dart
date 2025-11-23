import 'package:livee_manager/features/transaksi/domain/repositories/transacion_repository.dart';
import '../entities/transaction_entity.dart';

class GetAllTransactions {
  final TransactionRepository repository;

  GetAllTransactions(this.repository);

  Future<List<TransactionEntity>> call() {
    return repository.getAllTransactions();
  }
}
