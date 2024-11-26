import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable{
  final int? id;
  final String? customerId;
  final String name;
  final String devices;
  final String descriptions;
  final int period;
  final bool isDone;

  const OrderEntity({
    this.id,
    this.customerId,
    required this.name,
    required this.devices,
    required this.descriptions,
    required this.period,
    required this.isDone
  });
  
  @override
  get props => [
    id,
    customerId,
    name,
    devices,
    descriptions,
    period,
    isDone,
  ];
}