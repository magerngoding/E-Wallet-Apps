class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumnail;

  PaymentMethodModel({
    this.id,
    this.name,
    this.code,
    this.thumnail,
  });

// Untuk mengambil dari postman nya
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        thumnail: json['thumnail'],
      );
}
