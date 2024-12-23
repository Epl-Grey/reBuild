import 'package:rebuild/feature/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity{
  const OrderModel({
    super.id,
    super.customerId,
    required super.name,
    required super.devices,
    required super.descriptions,
    required super.period,
    required super.isDone,
    required super.isWorking,
  });

  factory OrderModel.fromJson(Map<String, dynamic> map) =>
    OrderModel(
      id: map['id'] as int,
      customerId: map['customer_id'] as String,
      name: map['name'] as String,
      devices: map['devices'] as String,
      descriptions: map['descriptions'],
      period: map['period'] as int,
      isDone: map['is_done'] as bool,
      isWorking: map['is_working'] as bool,
    );

  Map<String, dynamic> toJson() => {
      'id': id,
      'customer_id': customerId,
      'name': name,
      'devices': devices,
      'descriptions': descriptions,
      'period': period,
      'is_done': isDone,
      'is_working': isWorking,
  };
}