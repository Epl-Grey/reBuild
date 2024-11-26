import 'package:rebuild/feature/domain/entities/response_entity.dart';

class ResponseModel extends ResponseEntity{
  const ResponseModel({
    required super.id,
    required super.orderId,
    required super.contractorId,
    required super.period
  });

  factory ResponseModel.fromJson(Map<String, dynamic> map) =>
    ResponseModel(
      id: map['id'] as int,
      orderId: map['order_id'] as int,
      contractorId: map['contractor_id'] as String,
      period: map['period'] as int
    );

  Map<String, dynamic> toJson() => {
      'id': id,
      'order_id': orderId,
      'contractor_id': contractorId,
      'period': period,
  };
}