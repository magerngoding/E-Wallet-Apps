class DataPlantModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorCardId;

  DataPlantModel({
    this.id,
    this.name,
    this.price,
    this.operatorCardId,
  });

  factory DataPlantModel.fromJson(Map<String, dynamic> json) => DataPlantModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        operatorCardId: json['opeartor_card_id'],
      );
}
