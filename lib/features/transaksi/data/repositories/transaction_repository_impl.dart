import '../../domain/entities/transaction_entity.dart';
import 'package:livee_manager/features/transaksi/domain/repositories/transacion_repository.dart';
import '../datasources/transaction_remote_datasource.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource dataSource;

  TransactionRepositoryImpl(this.dataSource);

  @override
  Future<List<TransactionEntity>> getAllTransactions() async {
    return await dataSource.fetchTransactions();
  }

  @override
  Future<void> createTransaction(TransactionEntity transaction) async {
    return await dataSource.addTransaction(transaction as dynamic);
  }
}
