class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;

  PaymentMethodModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
  });

// Untuk mengambil dari postman nya
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        thumbnail: json['thumbnail'],
      );
}
