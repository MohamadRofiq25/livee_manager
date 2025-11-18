import '../../domain/entities/summary_entity.dart';

class SummaryModel extends SummaryEntity {
  SummaryModel({
    required super.pemasukan,
    required super.pengeluaran,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      pemasukan: json['pemasukan'],
      pengeluaran: json['pengeluaran'],
    );
  }
}
