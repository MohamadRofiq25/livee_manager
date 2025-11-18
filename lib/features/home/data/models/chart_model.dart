import 'package:livee_manager/features/home/domain/entities/chart_entity.dart';

class ChartModel extends ChartEntity {
  ChartModel({
    required super.label,
    required super.pemasukan,
    required super.pengeluaran,
  });

  factory ChartModel.fromJson(Map<String, dynamic> json) {
    return ChartModel(
      label: json['label'] as String,
      pemasukan: json['pemasukan'] as int,
      pengeluaran: json['pengeluaran'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'pemasukan': pemasukan,
      'pengeluaran': pengeluaran,
    };
  }
}
