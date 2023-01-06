import 'package:e_wallet/models/data_plan_model.dart';

class OperatorCardModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataPlantModel>? dataPlants;

  OperatorCardModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataPlants,
  });

  factory OperatorCardModel.fromJson(Map<String, dynamic> json) =>
      OperatorCardModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        thumbnail: json['thumbnail'],
        dataPlants: json['data_plans'] == null
            ? null
            : (json['data_plans'] as List)
                .map((dataPlan) => DataPlantModel.fromJson(dataPlan))
                .toList(),
      );
}
